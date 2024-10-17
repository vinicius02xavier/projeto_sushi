// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'item.dart';

class CarrinhoProvider with ChangeNotifier {
  List<Item> ItensCarrinho = [];

  List<Item> get itensCarrinho => ItensCarrinho;

  void addItem(Item item) {
    final existingItemIndex =
        itensCarrinho.indexWhere((i) => i.nome == item.nome);
    if (existingItemIndex >= 0) {
      itensCarrinho[existingItemIndex].quantidade += item.quantidade;
    } else {
      itensCarrinho.add(item);
    }
    notifyListeners();
  }

  void removeItem(Item item) {
    ItensCarrinho.remove(item);
    notifyListeners();
  }

  double get total => ItensCarrinho.fold(0, (soma, item) => soma + item.valor);
}
