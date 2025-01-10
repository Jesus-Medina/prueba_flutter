import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';

class CartListview extends StatelessWidget {
  final List<ProductModel> cartItems;
  const CartListview({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Envolvemos el contenido con un BlocBuilder para escuchar los cambios
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        return Container(
          color: Colors.grey[50],
          child: FractionallySizedBox(
            alignment: const Alignment(0, 0),
            heightFactor: 1,
            widthFactor: 1,
            child: ListView.builder(
              itemCount:
                  state.cart.length, // Usamos state.cart en lugar de cartItems
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(
                    context, index, state.cart); // Usamos state.cart
              },
            ),
          ),
        );
      },
    );
  }
}

Widget _buildItem(
    BuildContext context, int index, List<ProductModel> cartItems) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Row(
      spacing: 10,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () {
                context.read<EcommerceBloc>().add(
                      RemoveCartItemEvent(product: cartItems[index]),
                    );
              },
              child: const Icon(Icons.delete)),
        ),
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 1 / 1.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartItems[index].image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  cartItems[index].title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                cartItems[index].author,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(horizontal: 6),
                width: 65,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<EcommerceBloc>().add(
                              UpdateCartQuantityMinusEvent(
                                  product: cartItems[index]),
                            );
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 14,
                      ),
                    ),
                    Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          cartItems[index].quantity.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.buttonRed,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<EcommerceBloc>().add(
                              UpdateCartQuantityPlusEvent(
                                  product: cartItems[index]),
                            );
                      },
                      child: const Icon(
                        Icons.add,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: const Alignment(0.8, 0),
            child: FittedBox(
              child: Text(
                (cartItems[index].price * cartItems[index].quantity)
                    .toStringAsFixed(3),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
