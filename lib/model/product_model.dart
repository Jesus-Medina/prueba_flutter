import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final double price;
  final String image;
  final String description;
  final double rating;
  final int pages;
  final String language;
  final int quantity;
  final bool isFavorite;

  const ProductModel({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.pages,
    required this.language,
    this.quantity = 0,
    this.isFavorite = false,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    String? author,
    double? price,
    String? image,
    String? description,
    double? rating,
    int? pages,
    String? language,
    int? quantity,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      pages: pages ?? this.pages,
      language: language ?? this.language,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        price,
        image,
        description,
        rating,
        pages,
        language,
        quantity,
        isFavorite,
      ];
}
