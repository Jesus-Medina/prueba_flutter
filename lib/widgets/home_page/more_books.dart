import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/more_book_page.dart';

class MoreBooks extends StatelessWidget {
  final List<ProductModel> products;
  const MoreBooks({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Trending Book",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MoreBookPage(products: products)),
              );
            },
            child: Text(
              "Ver más",
              style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
