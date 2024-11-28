import 'package:flutter/material.dart';
import 'package:helloworld/modelos/produto.dart';
import 'package:helloworld/provedores/shop_provider.dart';
import 'package:provider/provider.dart';

class TelaProdutoDetalhes extends StatelessWidget {
  final Produto produto;

  const TelaProdutoDetalhes({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(produto.imagemPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descrição: ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 10),
                Text(
                  produto.descricao,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Valor: ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Text(
                      "R\$${produto.valor.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () => handleAddItem(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(200, 60),
                  ),
                  child: const Text(
                    "Adicionar ao carrinho",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  handleAddItem(BuildContext context) async {
    try {
      final shopProvider = context.read<ShopProvider>();
      await shopProvider.addItem(produto.id, 1);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Produto adicionado ao carrinho"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
