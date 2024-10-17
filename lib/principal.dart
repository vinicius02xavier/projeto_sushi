// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:helloworld/bebidas.dart';
import 'package:helloworld/carrinho.dart';
import 'package:helloworld/combinado03.dart';
import 'package:helloworld/combinado04.dart';
import 'package:helloworld/combinados.dart';
import 'package:helloworld/hossomakis.dart';
import 'package:helloworld/loading.dart';
import 'package:helloworld/niguiri_salmao.dart';
import 'package:helloworld/niguiris.dart';
import 'package:helloworld/pratos_quentes.dart';
import 'package:helloworld/sashimi_salmao.dart';
import 'package:helloworld/sashimis.dart';
import 'package:helloworld/sobremesas.dart';
import 'package:helloworld/temakis.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.only(bottom: 5, left: 10),
                decoration: BoxDecoration(color: Colors.red),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("Images/avatar.png"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Seu Nome",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "seuemail@email.com",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 40),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaPrincipal()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            SizedBox(height: 40),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaCarrinho()),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Lista de Compras",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            SizedBox(height: 40),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaLoading()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Sair",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
                Image(
                  height: 120,
                  width: 150,
                  image: AssetImage(
                    'Images/logojapa.png.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaCarrinho()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: criarCampoCategoria(
                          context, "Combinados", TelaCombinados()),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child:
                          criarCampoCategoria(context, "Temaki", TelaTemakis()),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: criarCampoCategoria(
                          context, "Sashimi", TelaSashimis()),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: criarCampoCategoria(
                          context, "Niguiri", TelaNiguiris()),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: criarCampoCategoria(
                          context, "Hossomaki", TelaHossomakis()),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: criarCampoCategoria(
                          context, "Pratos Quentes", TelaPratosQuentes()),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: criarCampoCategoria(
                          context, "Sobremesas", TelaSobremesas()),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      child: criarCampoCategoria(
                          context, "Bebidas", TelaBebidas()),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Mais Pedidos",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  children: [
                    SizedBox(height: 220),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: criarCampoItem(
                              context,
                              "Niguiri de Salmão",
                              "Images/niguiri_salmao.jpeg",
                              15,
                              TelaNiguiriSalmao()),
                        ),
                      ),
                    ),
                    Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: criarCampoItem(
                            context,
                            "Sashimi de Salmão",
                            "Images/sashimi_salmao.jpeg",
                            35,
                            TelaSashimiSalmao()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Row(
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: criarCampoItem(context, "Combinado 03",
                          "Images/combinado03.jpeg", 60, TelaCombinado03()),
                    ),
                  ),
                ),
                Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: criarCampoItem(context, "Combinado 04",
                        "Images/combinado04.jpeg", 85, TelaCombinado04()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget criarCampoCategoria(BuildContext context, String nome, Widget tela) {
  return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tela),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 130,
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xffffbebe),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.6),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                nome,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ])),
      ));
}

Widget criarCampoItem(
    BuildContext context, String nome, String imagem, int valor, Widget tela) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => tela),
      );
    },
    child: Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
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
                  valor.toString(),
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
