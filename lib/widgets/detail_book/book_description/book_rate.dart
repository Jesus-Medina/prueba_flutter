import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';

class BookRate extends StatelessWidget {
  final ProductModel product;
  const BookRate({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          color: Colors.grey[100],
          child: Row(
            children: [
              Expanded(
                flex: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rating",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      product.rating.toString(),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.grey[300],
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Expanded(
                flex: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Number of pages",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "${product.pages.toString()} pages",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.grey[300],
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Expanded(
                flex: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Languages",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      product.language,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
