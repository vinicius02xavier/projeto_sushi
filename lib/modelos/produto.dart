import 'package:uuid/uuid.dart';
import 'package:helloworld/modelos/categoria.dart';

class Produto {
  final String id;
  final String nome;
  final double valor;
  final String imagemPath;
  final String descricao;
  final Categoria categoria;

  Produto({
    String? id,
    required this.nome,
    required this.valor,
    required this.imagemPath,
    required this.categoria,
    required this.descricao,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'valor': valor,
        'imagemPath': imagemPath,
        'descricao': descricao,
        'categoria': categoria.toString(),
      };

  factory Produto.fromJson(Map<String, dynamic> json) {
    final categoriaIndex = Categoria.values
        .indexWhere((e) => e.toString().split('.')[1] == json['categoria']);

    if (categoriaIndex == -1) {
      throw Exception(json['categoria']);
    }

    return Produto(
      id: json['id'],
      nome: json['nome'],
      valor: json['valor'],
      imagemPath: json['imagemPath'],
      descricao: json['descricao'],
      categoria: Categoria.values
          .firstWhere((e) => e.toString().split('.')[1] == json['categoria']),
    );
  }
}
