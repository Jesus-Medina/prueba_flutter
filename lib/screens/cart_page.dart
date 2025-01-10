import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_checkout_button.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_custom_appbar.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_listview.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_total.dart';

class CartPage extends StatelessWidget {
  final List<ProductModel> cartItems;
  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _buildContentSections(context),
    );
  }

  Widget _buildContentSections(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildSection(screenSize, 0.113, CartCustomAppbar()),
        _buildSection(screenSize, 0.04, CartTotal()),
        _buildSection(screenSize, 0.69, CartListview(cartItems: cartItems)),
        _buildSection(screenSize, 0.15, CartCheckoutButton()),
      ],
    );
  }

  Widget _buildSection(Size screenSize, double heightFactor, Widget widget) {
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height * heightFactor,
      child: widget,
    );
  }
}
