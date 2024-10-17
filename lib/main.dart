// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:helloworld/loading.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarrinhoProvider(),
      child: MaterialApp(
        home: TelaLoading(),
      ),
    ),
  );
}
