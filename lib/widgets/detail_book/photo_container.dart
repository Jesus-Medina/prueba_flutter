import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';

class PhotoContainer extends StatelessWidget {
  final ProductModel product;
  
  const PhotoContainer({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: FractionallySizedBox(
        alignment: Alignment(0, 0),
        heightFactor: 0.7,
        widthFactor: 0.4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 25,
                spreadRadius: 1,
              ),
            ],
            image: DecorationImage(
              image: AssetImage(product.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}