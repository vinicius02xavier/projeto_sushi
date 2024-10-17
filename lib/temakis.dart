// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:helloworld/temaki_frito.dart';
import 'package:helloworld/temaki_grelhado.dart';
import 'package:helloworld/temaki_salmao.dart';

class TelaTemakis extends StatefulWidget {
  const TelaTemakis({Key? key}) : super(key: key);

  @override
  State<TelaTemakis> createState() => _TelaTemakisState();
}

class _TelaTemakisState extends State<TelaTemakis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "TEMAKIS",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                criarCampoItem(
                  context,
                  "Temaki de Salmão Grelhado",
                  "Images/temaki_salmao.jpeg",
                  "Arroz, Salmão Grelhado e Cream Cheese",
                  25,
                  TelaTemakiGrelhado(),
                ),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Temaki Frito",
                    "Images/temaki_frito.jpeg",
                    "Arroz e Salmão Grelhado, Cream Cheese, Empanado e Frito",
                    25,
                    TelaTemakiFrito()),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Temaki de Salmão",
                    "Images/temaki_salmao.jpeg",
                    "Arroz e Salmão Batido com Cebolinha",
                    27,
                    TelaTemakiSalmao()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget criarCampoItem(BuildContext context, String nome, String imagem,
    String descricao, int valor, Widget tela) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => tela));
    },
    child: Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagem),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "R\$" + valor.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
