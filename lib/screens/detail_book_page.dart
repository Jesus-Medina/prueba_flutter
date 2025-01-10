import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description.dart';
import 'package:prueba_final_flutter/widgets/detail_book/detail_custom_app_bar.dart';
import 'package:prueba_final_flutter/widgets/detail_book/photo_container.dart';

class DetailBookPage extends StatelessWidget {
  final ProductModel product;

  const DetailBookPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      body: _buildContentSections(context),
    );
  }

  Widget _buildContentSections(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildSection(screenSize, 0.113, DetailCustomAppBar()),
        _buildSection(screenSize, 0.40, PhotoContainer(product: product)),
        _buildSection(screenSize, 0.47, BookDescription(product: product)),
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
