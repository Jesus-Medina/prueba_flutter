import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';

class BookDescriptionText extends StatelessWidget {
  final ProductModel product;
  const BookDescriptionText({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment(0, 1),
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: Text(product.description,
        style: TextStyle(
          fontSize: 11,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
