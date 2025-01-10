import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/cart_page.dart';
import 'package:prueba_final_flutter/screens/form_page.dart';

class Header extends StatelessWidget {
  final List<ProductModel> cartItems;

  const Header({
    super.key,
    required this.cartItems,
  });

  // Método para calcular el total de items
  int _getTotalCartItems() {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: const Alignment(0, 0.45),
      widthFactor: 0.95,
      heightFactor: 0.5,
      child: SizedBox(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMenuIcon(constraints, context),
                  _buildHeaderRightSection(constraints, context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuIcon(BoxConstraints constraints, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FormPage()),
        );
      },
      child: Image.asset(
        "assets/images/menu_icon.png",
        height: constraints.maxHeight * 0.5,
        width: constraints.maxHeight * 0.5,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeaderRightSection(
      BoxConstraints constraints, BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems)),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                "assets/images/shopping_bag.png",
                height: constraints.maxHeight * 0.5,
                width: constraints.maxHeight * 0.5,
                fit: BoxFit.cover,
              ),
              if (cartItems.isNotEmpty)
                _buildCartNotificationBadge(constraints),
            ],
          ),
        ),
        const SizedBox(width: 12),
        _buildProfileSection(constraints),
      ],
    );
  }

  Widget _buildCartNotificationBadge(BoxConstraints constraints) {
    return Positioned(
      top: 0,
      right: -5,
      child: Container(
        height: constraints.maxHeight * 0.33,
        decoration: BoxDecoration(
          color: AppColors.buttonRed,
          border: Border.all(
            color: AppColors.primaryBackground,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Text(
              _getTotalCartItems().toString(),
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BoxConstraints constraints) {
    return Stack(
      children: [
        _buildProfileImage(constraints),
        _buildProfileNotificationBadge(constraints),
      ],
    );
  }

  Widget _buildProfileImage(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight * 0.8,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage("https://thispersondoesnotexist.com/"),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: AppColors.primaryBackground,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileNotificationBadge(BoxConstraints constraints) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: constraints.maxHeight * 0.33,
        decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(
            color: AppColors.primaryBackground,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Text(
              "2",
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryBackground,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
