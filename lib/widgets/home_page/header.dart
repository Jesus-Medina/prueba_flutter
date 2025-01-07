import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: const Alignment(0, 0.5),
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
                  _buildMenuIcon(constraints),
                  _buildHeaderRightSection(constraints),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuIcon(BoxConstraints constraints) {
    return Image.asset(
      "assets/images/menu_icon.png",
      height: constraints.maxHeight * 0.5,
      width: constraints.maxHeight * 0.5,
      fit: BoxFit.cover,
    );
  }

  Widget _buildHeaderRightSection(BoxConstraints constraints) {
    return Row(
      children: [
        Image.asset(
          "assets/images/shopping_bag.png",
          height: constraints.maxHeight * 0.5,
          width: constraints.maxHeight * 0.5,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        _buildProfileSection(constraints),
      ],
    );
  }

  Widget _buildProfileSection(BoxConstraints constraints) {
    return Stack(
      children: [
        _buildProfileImage(constraints),
        _buildNotificationBadge(constraints),
      ],
    );
  }

  Widget _buildProfileImage(BoxConstraints constraints) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.maxHeight * 0.8,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/profile.jpeg"),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.white,
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
      ),
    );
  }

  Widget _buildNotificationBadge(BoxConstraints constraints) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: constraints.maxHeight * 0.33,
        decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Text(
              "2",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
