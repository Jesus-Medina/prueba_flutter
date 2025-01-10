import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';

class CartCheckoutButton extends StatelessWidget {
  const CartCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment(0, 0),
      widthFactor: 0.7,
      heightFactor: 0.4,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Checkout",
          style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
