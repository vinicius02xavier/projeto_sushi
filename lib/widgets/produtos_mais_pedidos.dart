import 'package:flutter/material.dart';
import 'package:helloworld/provedores/shop_provider.dart';
import 'package:helloworld/widgets/produto_card_mais_pedido.dart';
import 'package:provider/provider.dart';

class ProdutosMaisPedidosWidget extends StatelessWidget {
  const ProdutosMaisPedidosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShopProvider>();
    final produtos = provider.produtos.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              return ProdutoCardMaisPedido(produto: produtos[index]);
            },
          ),
        ),
      ],
    );
  }

  Padding _header() {
    return const Padding(
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
    );
  }
}
