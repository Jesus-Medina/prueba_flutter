import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final String image;
  final double price;
  final String description;
  final int quantity;

  const ProductModel({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.price,
    required this.description,
    this.quantity = 0,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    String? author,
    String? image,
    double? price,
    String? description,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        description,
        image,
        price,
        quantity,
      ];
}
