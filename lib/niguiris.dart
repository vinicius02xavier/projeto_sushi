// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:helloworld/niguiri_branco.dart';
import 'package:helloworld/niguiri_camarao.dart';
import 'package:helloworld/niguiri_salmao.dart';

class TelaNiguiris extends StatefulWidget {
  const TelaNiguiris({Key? key}) : super(key: key);

  @override
  State<TelaNiguiris> createState() => _TelaNiguirisState();
}

class _TelaNiguirisState extends State<TelaNiguiris> {
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
                  "NIGUIRIS",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                criarCampoItem(
                  context,
                  "Niguiri de Salmão",
                  "Images/niguiri_salmao.jpeg",
                  "04 Unidades de Arroz com Salmão Cru",
                  15,
                  TelaNiguiriSalmao(),
                ),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Niguiri de Camarão",
                    "Images/niguiri_camarao.jpeg",
                    "04 Unidades de Arroz com Camarão",
                    20,
                    TelaNiguiriCamarao()),
                SizedBox(height: 20),
                criarCampoItem(
                    context,
                    "Niguiri de Peixe Branco",
                    "Images/niguiri_branco.jpeg",
                    "04 Unidades de Arroz com Peixe Branco Cru",
                    15,
                    TelaNiguiriBranco()),
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
