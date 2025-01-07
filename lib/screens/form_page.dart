import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_checkout_button.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_custom_appbar.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_listview.dart';
import 'package:prueba_final_flutter/widgets/cart_page/cart_total.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildContentSections(context),
    );
  }

  Widget _buildContentSections(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildSection(screenSize, 1, Container(color: Colors.red)),
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
