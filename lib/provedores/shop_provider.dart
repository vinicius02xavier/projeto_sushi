import 'package:flutter/material.dart';
import 'package:helloworld/modelos/item_carrinho.dart';
import 'package:helloworld/modelos/produto.dart';
import 'package:helloworld/repositories/carrinho_repositorio.dart';
import 'package:helloworld/repositories/produto_repositorio.dart';
import 'package:helloworld/services/auth_service.dart';

class ShopProvider with ChangeNotifier {
  final ProdutoRepositorio _produtoRepositorio = ProdutoRepositorio();
  final CarrinhoRepositorio _carrinhoRepositorio = CarrinhoRepositorio();
  final AuthService _authService = AuthService();

  List<ItemCarrinho> itensCarrinho = [];
  List<Produto> produtos = [];

  bool fetchCompleted = false;
  bool fetchSuccess = false;

  ShopProvider() {
    fetch();
  }

  Future<void> fetch() async {
    try {
      final results = await Future.wait([
        _carrinhoRepositorio.obterTodos(_authService.currentUser!.uid),
        _produtoRepositorio.obterTodos()
      ]);

      itensCarrinho.addAll(results[0] as List<ItemCarrinho>);
      produtos.addAll(results[1] as List<Produto>);

      fetchSuccess = true;
    } catch (e) {
      fetchSuccess = false;
      debugPrint('Erro ao carregar dados: $e');
    } finally {
      fetchCompleted = true;
      notifyListeners();
    }
  }

  double get totalPedido {
    double total = 0;

    for (var itemCarrinho in itensCarrinho) {
      final produto =
          produtos.firstWhere((p) => p.id == itemCarrinho.produtoId);

      total += produto.valor * itemCarrinho.quantidade;
    }

    return total;
  }

  Future<void> addItem(String produtoId, int quantidade) async {
    final user = _authService.currentUser;
    if (user == null) {
      throw Exception("not auth");
    }

    final indiceItem =
        itensCarrinho.indexWhere((i) => i.produtoId == produtoId);

    if (indiceItem >= 0) {
      final item = itensCarrinho[indiceItem];
      item.quantidade += quantidade;

      await _carrinhoRepositorio.put(item);

      notifyListeners();
      return;
    }

    final item = ItemCarrinho(
        userId: user.uid, produtoId: produtoId, quantidade: quantidade);

    itensCarrinho.add(item);
    await _carrinhoRepositorio.put(item);

    notifyListeners();
  }

  Future<void> removeItem(String produtoId) async {
    final index = itensCarrinho.indexWhere((i) => i.produtoId == produtoId);
    await _carrinhoRepositorio.remove(itensCarrinho[index].id);
    itensCarrinho.removeAt(index);
    notifyListeners();
  }
}