import 'package:flutter/material.dart';
import 'package:helloworld/services/auth_service.dart';
import 'package:helloworld/visualizacoes/carrinho.dart';
import 'package:helloworld/visualizacoes/loading.dart';
import 'package:helloworld/visualizacoes/principal.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, left: 10),
              decoration: const BoxDecoration(color: Colors.red),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user?.photoURL ?? ''),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user?.displayName ?? "-",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user?.email ?? '-',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ]),
            ),
          ),
          const SizedBox(height: 40),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TelaPrincipal()));
              },
              child: const ListTile(
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
          const SizedBox(height: 40),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCarrinho()),
                );
              },
              child: const ListTile(
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
          const SizedBox(height: 40),
          InkWell(
              onTap: () => handleSignOut(context),
              child: const ListTile(
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
    );
  }

  handleSignOut(context) async {
    try {
      await _authService.signOut();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TelaLoading()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erro inesperado: $e")));
    }
  }
}
