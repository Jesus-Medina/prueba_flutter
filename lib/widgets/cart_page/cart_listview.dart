import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      color: Colors.white,
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
      children: [
        const Icon(Icons.delete),
        const SizedBox(width: 10),
        Container(
          height: 80,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(cartItems[index].image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItems[index].title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
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
                    onTap: () {},
                    child: const Icon(
                      Icons.remove,
                      size: 14,
                    ),
                  ),
                  Center(
                    child: Text(
                      cartItems[index].quantity.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<EcommerceBloc>().add(
                            AddToCartProductsEvent(product: cartItems[index]),
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
        Expanded(
          child: Container(
            alignment: const Alignment(0.8, 0),
            child: Text(
              (cartItems[index].price * cartItems[index].quantity).toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
