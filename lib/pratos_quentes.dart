// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:helloworld/yakissoba_carne.dart';
import 'package:helloworld/yakissoba_frango.dart';
import 'package:helloworld/yakissoba_misto.dart';
import 'package:helloworld/gohan.dart';
import 'package:helloworld/tempura.dart';

class TelaPratosQuentes extends StatefulWidget {
  const TelaPratosQuentes({Key? key}) : super(key: key);

  @override
  State<TelaPratosQuentes> createState() => _TelaPratosQuentesState();
}

class _TelaPratosQuentesState extends State<TelaPratosQuentes> {
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
                  "PRATOS QUENTES",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                criarCampoItem(
                  context,
                  "Yakissoba Misto",
                  "Images/yakissoba_misto.jpeg",
                  "Típico Macarrão Japonês com Carne, Frango e Legumes.",
                  25,
                  TelaYakissobaMisto(),
                ),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Yakissoba de Carne",
                    "Images/yakissoba_carne.jpeg",
                    "Típico Macarrão Japonês com Carne e Legumes.",
                    25,
                    TelaYakissobaCarne()),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Yakissoba de Frango",
                    "Images/yakissoba_frango.jpeg",
                    "Típico Macarrão Japonês com Frango e Legumes.",
                    23,
                    TelaYakissobaFrango()),
                SizedBox(height: 20),
                criarCampoItem(context, "Gohan", "Images/gohan.jpeg",
                    "Arroz Branco Tipo Japonês", 10, TelaGohan()),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Tempurá de Legumes",
                    "Images/tempura.jpeg",
                    "Legumes Empanados e Fritos",
                    32,
                    TelaTempura()),
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
