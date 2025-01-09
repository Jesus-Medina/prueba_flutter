class ProductModel {
  final String id;
  final String title;
  final String author;
  final double price;
  final String image;
  final String description;
  final double rating;
  final int pages;
  final String language;
  final bool isFavorite;
  final int quantity;

  ProductModel({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.pages,
    required this.language,
    this.isFavorite = false,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      author: json['author'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      pages: (json['pages'] as num).toInt(),
      language: json['language'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
      quantity: json['quantity'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'price': price,
      'image': image,
      'description': description,
      'rating': rating,
      'pages': pages,
      'language': language,
      'isFavorite': isFavorite,
      'quantity': quantity,
    };
  }

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
    bool? isFavorite,
    int? quantity,
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
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
    );
  }
}
