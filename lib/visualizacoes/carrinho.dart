import 'package:flutter/material.dart';
import 'package:helloworld/provedores/shop_provider.dart';
import 'package:helloworld/visualizacoes/pagamento.dart';
import 'package:provider/provider.dart';

class TelaCarrinho extends StatelessWidget {
  const TelaCarrinho({super.key});

  @override
  Widget build(BuildContext context) {
    final finishPurchaseBtn =
        context.watch<ShopProvider>().itensCarrinho.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => handleFinishPurchaseClick(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(200, 60),
                  ),
                  child: const Text(
                    'Finalizar Compra',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ));

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<ShopProvider>(
              builder: (context, shopProvider, child) {
                if (shopProvider.itensCarrinho.isEmpty) {
                  return const Center(
                    child: Text(
                      'O carrinho está vazio.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: shopProvider.itensCarrinho.length,
                        itemBuilder: (context, index) {
                          final item = shopProvider.itensCarrinho[index];
                          final produto = shopProvider.produtos
                              .firstWhere((p) => p.id == item.produtoId);

                          return ListTile(
                            title: Text(produto.nome),
                            subtitle: Text(
                              'Preço: R\$ ${produto.valor.toStringAsFixed(2)} X ${item.quantidade}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_rounded,
                                  color: Colors.red),
                              onPressed: () {
                                shopProvider.removeItem(item.produtoId);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Total: R\$ ${shopProvider.totalPedido.toStringAsFixed(2)}',
                        style: const TextStyle(
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
          finishPurchaseBtn
        ],
      ),
    );
  }

  handleFinishPurchaseClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TelaPagamento()),
    );
  }
}
