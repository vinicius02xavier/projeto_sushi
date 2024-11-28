import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/modelos/produto.dart';

class ProdutoRepositorio {
  final firestore = FirebaseFirestore.instance.collection("produtos");

  Future<void> put(Produto item) async {
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

  Future<Produto?> obterPorId(String id) async {
    try {
      final doc = await firestore.doc(id).get();

      if (doc.exists) {
        return Produto.fromJson(doc.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter item: $e');
      return null;
    }
  }

  Future<List<Produto>> obterTodos() async {
    try {
      final snapshot = await firestore.get();

      return snapshot.docs.map((doc) => Produto.fromJson(doc.data())).toList();
    } catch (e) {
      print('Erro ao obter itens: $e');
      return [];
    }
  }
}