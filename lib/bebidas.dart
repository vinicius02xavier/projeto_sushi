// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:helloworld/guarana.dart';
import 'package:helloworld/coca_cola.dart';
import 'package:helloworld/h2o.dart';
import 'package:helloworld/agua01.dart';
import 'package:helloworld/agua02.dart';
import 'package:helloworld/suco_uva.dart';
import 'package:helloworld/suco_maracuja.dart';

class TelaBebidas extends StatefulWidget {
  const TelaBebidas({Key? key}) : super(key: key);

  @override
  State<TelaBebidas> createState() => _TelaBebidasState();
}

class _TelaBebidasState extends State<TelaBebidas> {
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
                  "BEBIDAS",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                criarCampoItem(
                  context,
                  "Guaraná Antártica",
                  "Images/guarana.png",
                  "Guaraná Antártica Lata 350ML",
                  6.5,
                  TelaGuarana(),
                ),
                SizedBox(height: 20),
                criarCampoItem(context, "Coca-Cola", "Images/coca_cola.png",
                    "Coca-Cola Lata 350ML", 6.5, TelaCocaCola()),
                SizedBox(height: 20),
                criarCampoItem(context, "H2O", "Images/h2o.jpeg", "H2O 500ML",
                    10, TelaH2O()),
                SizedBox(height: 20),
                criarCampoItem(context, "Água s/ Gás", "Images/agua01.jpeg",
                    "Água s/ Gás", 5, TelaAgua01()),
                SizedBox(height: 20),
                criarCampoItem(context, "Água c/ Gás", "Images/agua02.jpeg",
                    "Água c/ Gás", 6.5, TelaAgua02()),
                SizedBox(height: 20),
                criarCampoItem(context, "Suco Del Valle Uva Lata 290ML", "Images/suco_uva.jpeg", "Suco Del Valle Uva Lata 290ML",
                    7, TelaSucoUva()),
                SizedBox(height: 20),
                criarCampoItem(context, "Suco Del Valle Maracujá Lata 290ML", "Images/suco_maracuja.jpeg", "Suco Del Valle Maracujá Lata 290ML",
                    7, TelaSucoMaracuja()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget criarCampoItem(BuildContext context, String nome, String imagem,
    String descricao, double valor, Widget tela) {
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
