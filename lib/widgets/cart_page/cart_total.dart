import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        // Calculamos el total sumando el precio * cantidad de cada producto
        double total = state.cart.fold(
          0,
          (sum, item) => sum + (item.price * item.quantity),
        );

        return FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 1,
          child: Text("total: \$${total.toStringAsFixed(3)}",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
              )),
        );
      },
    );
  }
}
