import 'package:flutter/material.dart';
import 'package:helloworld/visualizacoes/login.dart';

class TelaLoading extends StatelessWidget {
  const TelaLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaLogin()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFedf2f4), Colors.red],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Images/logojapa.png.png',
                color: Colors.black,
                width: 200,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
