import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';

class BookBuy extends StatelessWidget {
  final ProductModel product;

  const BookBuy({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.7,
      alignment: const Alignment(0, -0.2),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Container(
              color: Colors.grey[200],
              width: constraints.maxWidth * 0.55,
              height: constraints.maxHeight * 0.65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "QTY",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const Icon(Icons.remove),
                  const Text(
                    "1",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.teal,
                    ),
                  ),
                  const Icon(Icons.add),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: constraints.maxWidth * 0.35,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<EcommerceBloc>().add(
                            AddToCartProductsEvent(product: product),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7052),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
