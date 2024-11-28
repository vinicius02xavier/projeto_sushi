import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/firebase_options.dart';
import 'package:helloworld/provedores/shop_provider.dart';
import 'package:helloworld/visualizacoes/loading.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  seedFirestoreInParallel();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ShopProvider(),
      child: const MaterialApp(
        home: TelaLoading(),
      ),
    ),
  );
}

Future<void> seedFirestoreInParallel() async {
  try {
    var content = await rootBundle.loadString('data.json');
    var fileJson = json.decode(content);

    CollectionReference produtosCollection =
        FirebaseFirestore.instance.collection('produtos');

    var snapshot = await produtosCollection.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    
    List<Future> writes = fileJson['produtos'].map<Future>((item) {
      print(item);
      return produtosCollection.doc(item['id']).set(item);
    }).toList();

    await Future.wait(writes);  

    print('Dados carregados com sucesso no Firestore!');
  } catch (e) {
    print('Erro ao carregar os dados: $e');
  }
}
