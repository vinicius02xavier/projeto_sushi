// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:helloworld/combinado01.dart';
import 'package:helloworld/combinado02.dart';
import 'package:helloworld/combinado03.dart';
import 'package:helloworld/combinado04.dart';

class TelaCombinados extends StatefulWidget {
  const TelaCombinados({Key? key}) : super(key: key);

  @override
  State<TelaCombinados> createState() => _TelaCombinadosState();
}

class _TelaCombinadosState extends State<TelaCombinados> {
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
                  "COMBINADOS",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                criarCampoItem(
                  context,
                  "Combinado 01",
                  "Images/combinado01.jpeg",
                  "1 PORÇÃO CEVICHE, 1 PORÇÃO SUNOMONO, 10 SASHIMI SALMÃO, 5 SASHIMI PEIXE BRANCO, 8 SAKEMAKI, 4 NIGUIRI MISTO, 4 JOE SALMÃO, 5 SKIN, 5 SHAKE ESPECIAL, 5 HOT SALMÃO, 4 FRY CHEESE, 2 YAKISSOBA MISTO",
                  120,
                  TelaCombinado01(),
                ),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Combinado 02",
                    "Images/combinado02.jpeg",
                    "20 SASHIMI, 10 NIGUIRI, 10 ACELGA, 20 URAMAKI, 10 HOT SKIN, 16 SAKEMAKI, 4 JOE DE SALMÃO",
                    140,
                    TelaCombinado02()),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Combinado 03",
                    "Images/combinado03.jpeg",
                    "5 FRY CHEESE, 5 HOT SALMÃO, 10 HOT SKIN, 10 HOT ROLL",
                    60,
                    TelaCombinado03()),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Combinado 04",
                    "Images/combinado04.jpeg",
                    "8 SASHIMI, 6 NIGUIRI, 16 SAKEMAKI, 10 SHAKE ESPECIAL, 10 HOT SKIN, 4 JOE",
                    85,
                    TelaCombinado04()),
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
