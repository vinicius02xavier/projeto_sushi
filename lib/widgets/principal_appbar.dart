import 'package:flutter/material.dart';
import 'package:helloworld/visualizacoes/carrinho.dart';

class PrincipalAppbar extends StatelessWidget {
  const PrincipalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                MaterialPageRoute(builder: (context) => TelaCarrinho()),
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
    );
  }
}
