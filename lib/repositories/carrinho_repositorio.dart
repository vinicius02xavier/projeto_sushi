import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/modelos/item_carrinho.dart';

class CarrinhoRepositorio {
  final firestore = FirebaseFirestore.instance.collection("carrinho");

  Future<void> put(ItemCarrinho item) async {
    try {
      await firestore.doc(item.id).set(item.toJson());
    } catch (e) {
      print('Erro ao adicionar item: $e');
    }
  }

  Future<void> remove(String id) async {
    try {
      await firestore.doc(id).delete();
    } catch (e) {
      print('Erro ao remover item: $e');
    }
  }

  Future<ItemCarrinho?> obterPorId(String id) async {
    try {
      final doc = await firestore.doc(id).get();

      if (doc.exists) {
        return ItemCarrinho.fromJson(doc.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter item: $e');
      return null;
    }
  }

  Future<List<ItemCarrinho>> obterTodos(String userId) async {
    try {
      final snapshot = await firestore.where('userId', isEqualTo: userId).get();

      return snapshot.docs.map((doc) => ItemCarrinho.fromJson(doc.data())).toList();
    } catch (e) {
      print('Erro ao obter itens: $e');
      return [];
    }
  }
}
