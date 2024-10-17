// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:helloworld/pagamento.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class TelaCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
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
          ),
          SizedBox(height: 20),
          Expanded(
            child: Consumer<CarrinhoProvider>(
              builder: (context, carrinhoProvider, child) {
                final itens = carrinhoProvider.itensCarrinho;

                if (itens.isEmpty) {
                  return Center(
                    child: Text(
                      'O carrinho está vazio.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                double total = itens.fold(
                    0, (soma, item) => soma + (item.valor * item.quantidade));

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (context, index) {
                          final item = itens[index];
                          return ListTile(
                            title: Text(item.nome),
                            subtitle: Text(
                              'Preço: R\$ ${item.valor.toStringAsFixed(2)} X ${item.quantidade}',
                            ),
                            trailing: IconButton(
                              icon:
                                  Icon(Icons.delete_rounded, color: Colors.red),
                              onPressed: () {
                                carrinhoProvider.removeItem(item);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Total: R\$ ${total.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaPagamento()),
                  );
                },
                child: Text(
                  'Finalizar Compra',
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
              ))
        ],
      ),
    );
  }
}
