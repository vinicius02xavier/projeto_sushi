import 'package:uuid/uuid.dart';

class ItemCarrinho  {
  String id;
  final String produtoId;
  final String userId;
  int quantidade;

  ItemCarrinho({
    String? id,
    required this.userId,
    required this.produtoId,
    this.quantidade = 1,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'produtoId': produtoId,
        'quantidade': quantidade,
        'userId': userId,
      };

  factory ItemCarrinho.fromJson(Map<String, dynamic> json) => ItemCarrinho(
        id: json['id'],
        userId: json['userId'],
        produtoId: json['produtoId'],
        quantidade: json['quantidade'],
      );
}
