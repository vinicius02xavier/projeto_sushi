// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:helloworld/provider.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class TelaNiguiriSalmao extends StatefulWidget {
  const TelaNiguiriSalmao({Key? key}) : super(key: key);

  @override
  State<TelaNiguiriSalmao> createState() => _TelaNiguiriSalmaoState();
}

class _TelaNiguiriSalmaoState extends State<TelaNiguiriSalmao> {
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
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("Images/niguiri_salmao.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descrição: ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 10),
                Text(
                  "04 UNIDADES DE ARROZ COM SALMÃO CRU",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Valor: ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Text(
                      "R\$15",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    final newItem =
                        Item(nome: "Niguiri de Salmão", valor: 15.0);
                    Provider.of<CarrinhoProvider>(context, listen: false)
                        .addItem(newItem);
                    final snackBar = SnackBar(
                      backgroundColor: Color(0xfff98a82),
                      content: Text(
                        "Adicionado com sucesso!",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    "Adicionar ao carrinho",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(200, 60),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}