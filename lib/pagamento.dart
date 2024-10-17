// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class TelaPagamento extends StatefulWidget {
  @override
  _TelaPagamentoState createState() => _TelaPagamentoState();
}

class _TelaPagamentoState extends State<TelaPagamento> {
  String _paymentMethod = 'cartao';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pagamento',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Escolha o melhor meio de pagamento:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _paymentMethod = 'cartao';
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 48,
                          color: _paymentMethod == 'cartao'
                              ? Colors.red
                              : Colors.grey,
                        ),
                        Text('Cartão'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _paymentMethod = 'pix';
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.qr_code,
                          size: 48,
                          color: _paymentMethod == 'pix'
                              ? Colors.red
                              : Colors.grey,
                        ),
                        Text('Pix'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              _paymentMethod == 'cartao'
                  ? buildCardPayment()
                  : buildPixPayment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardPayment() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Número do Cartão',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Nome do Titular',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Validade',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Ação ao clicar no botão de pagamento com cartão
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.red,
          ),
          child: Text(
            'Pagar',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPixPayment() {
    return Column(
      children: [
        Text(
          'Pagamento via Pix',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Container(
          height: 200,
          color: Colors.grey[200],
          child: Center(
            child: Icon(
              Icons.qr_code_2,
              size: 100,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Escaneie o QR Code com seu app de banco ou copie a chave Pix abaixo:',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Chave Pix',
            border: OutlineInputBorder(),
          ),
          readOnly: true,
          controller: TextEditingController(
              text: '123e4567-e89b-12d3-a456-426614174000'),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Chave Pix copiada com sucesso!"),
                duration: Duration(
                  seconds: 3,
                )));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.red,
          ),
          child: Text(
            'Copiar Chave Pix',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
