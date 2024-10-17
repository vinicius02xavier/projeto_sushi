// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:helloworld/sashimi_branco.dart';
import 'package:helloworld/sashimi_salmao.dart';

class TelaSashimis extends StatefulWidget {
  const TelaSashimis({Key? key}) : super(key: key);

  @override
  State<TelaSashimis> createState() => _TelaSashimisState();
}

class _TelaSashimisState extends State<TelaSashimis> {
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
                  "SASHIMIS",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                criarCampoItem(
                  context,
                  "Salmão",
                  "Images/sashimi_salmao.jpeg",
                  "08 Fatias de Salmão Cru",
                  35,
                  TelaSashimiSalmao(),
                ),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Peixe Branco",
                    "Images/sashimi_branco.jpeg",
                    "08 Fatias Finas de Peixe Cru",
                    32,
                    TelaSashimiBranco()),
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
