import 'package:flutter/material.dart';
import 'package:helloworld/modelos/categoria.dart';
import 'package:helloworld/provedores/shop_provider.dart';
import 'package:helloworld/widgets/produto_card.dart';
import 'package:provider/provider.dart';

class TelaProdutosPorCategoria extends StatelessWidget {
  final Categoria categoria;

  const TelaProdutosPorCategoria({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.descricao.toUpperCase()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                categoria.descricao.toUpperCase(),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Consumer<ShopProvider>(
                builder:
                    (BuildContext context, ShopProvider value, Widget? child) {
                  final produtos = value.produtos
                      .where((p) => p.categoria == categoria)
                      .toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ProdutoCardWidget(produto: produtos[index]),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                    itemCount: produtos.length,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
