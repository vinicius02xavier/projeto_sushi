import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RepositorioBase<T> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionName;

  RepositorioBase(this.collectionName);

  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T item);

  Future<void> adicionar(String id, T item) async {
    try {
      await firestore.collection(collectionName).doc(id).set(toJson(item));
    } catch (e) {
      print('Erro ao adicionar item: $e');
    }
  }

  Future<void> update(String id, T item) async {
    try {
      await firestore.collection(collectionName).doc(id).update(toJson(item));
    } catch (e) {
      print('Erro ao atualizar item: $e');
    }
  }

  Future<void> removerItem(String id) async {
    try {
      await firestore.collection(collectionName).doc(id).delete();
    } catch (e) {
      print('Erro ao remover item: $e');
    }
  }

  Future<T?> obterItem(String id) async {
    try {
      final doc = await firestore.collection(collectionName).doc(id).get();

      if (doc.exists) {
        return fromJson(doc.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter item: $e');
      return null;
    }
  }

  Future<List<T>> obterTodos() async {
    try {
      final snapshot = await firestore.collection(collectionName).get();

      return snapshot.docs.map((doc) => fromJson(doc.data())).toList();
    } catch (e) {
      print('Erro ao obter itens: $e');
      return [];
    }
  }
}
