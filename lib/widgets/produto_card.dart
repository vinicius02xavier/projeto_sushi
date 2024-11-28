import 'package:flutter/material.dart';
import 'package:helloworld/modelos/produto.dart';
import 'package:helloworld/visualizacoes/produto_detalhes.dart';

class ProdutoCardWidget extends StatelessWidget {
  final Produto produto;

  const ProdutoCardWidget({super.key, required this.produto});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelaProdutoDetalhes(produto: produto))),
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
                    image: AssetImage(produto.imagemPath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        produto.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "R\$ ${produto.valor.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
