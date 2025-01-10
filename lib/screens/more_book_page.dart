import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/widgets/more_book/book_list.dart';
import 'package:prueba_final_flutter/widgets/more_book/more_custom_appbar.dart';

class MoreBookPage extends StatelessWidget {
  final List<ProductModel> products;
  const MoreBookPage({super.key, required this.products});

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
        _buildSection(screenSize, 0.113, MoreCustomAppbar()),
        _buildSection(screenSize, 0.88, BookList(products: products)),
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
