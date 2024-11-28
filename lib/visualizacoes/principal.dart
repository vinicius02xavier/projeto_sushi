import 'package:flutter/material.dart';
import 'package:helloworld/modelos/categoria.dart';
import 'package:helloworld/provedores/shop_provider.dart';
import 'package:helloworld/visualizacoes/carrinho.dart';
import 'package:helloworld/widgets/btn_categoria.dart';
import 'package:helloworld/widgets/produtos_mais_pedidos.dart';
import 'package:helloworld/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShopProvider>();

    if (!provider.fetchCompleted) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (!provider.fetchSuccess) {
      return const Scaffold(
          body: Center(
        child:
            Text("Erro inesperado ocorrindo durante a consulta dos dados..."),
      ));
    }

    return Scaffold(
      drawer: Sidebar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
                const Image(
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
                      MaterialPageRoute(
                          builder: (context) => const TelaCarrinho()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Row(
              children: Categoria.values.map((categoria) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: BtnCategoria(categoria: categoria),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 40),
          const ProdutosMaisPedidosWidget()
        ],
      ),
    );
  }
}
