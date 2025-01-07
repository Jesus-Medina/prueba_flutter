import 'package:flutter/material.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 1,
      child: Text("total: \$100.00",
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 16,
          )),
    );
  }
}
