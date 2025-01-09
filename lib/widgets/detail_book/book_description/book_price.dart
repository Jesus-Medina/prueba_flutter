import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';

class BookPrice extends StatelessWidget {
  final ProductModel product;
  const BookPrice({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: FractionallySizedBox(
          alignment: Alignment(0, 1),
          heightFactor: 0.75,
          widthFactor: 0.90,
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.price.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        product.author,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment(1, -0.5),
                    child: FractionallySizedBox(
                      heightFactor: 0.7,
                      widthFactor: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
