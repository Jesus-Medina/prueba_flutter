import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';

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
                      "\$${product.price.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: FittedBox(
                        child: Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                    child: BlocBuilder<EcommerceBloc, EcommerceState>(
                      buildWhen: (previous, current) {
                        // Reconstruir solo cuando cambia la lista de productos
                        return previous.products != current.products;
                      },
                      builder: (context, state) {
                        // Encontrar el producto actualizado en la lista de productos
                        final updatedProduct = state.products.firstWhere(
                          (p) => p.id == product.id,
                          orElse: () => product,
                        );

                        return GestureDetector(
                          onTap: () {
                            context.read<EcommerceBloc>().add(
                                  AddToFavoritesProductsEvent(
                                      product: updatedProduct),
                                );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: updatedProduct.isFavorite
                                  ? Colors.red
                                  : Colors.teal,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
