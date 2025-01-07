import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description.dart';
import 'package:prueba_final_flutter/widgets/detail_book/detail_custom_app_bar.dart';
import 'package:prueba_final_flutter/widgets/detail_book/photo_container.dart';

class DetailBookPage extends StatelessWidget {
  const DetailBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _buildContentSections(context),
    );
  }

  Widget _buildContentSections(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildSection(screenSize, 0.113, DetailCustomAppBar()),
        _buildSection(screenSize, 0.40, PhotoContainer()),
        _buildSection(screenSize, 0.47, BookDescription()),
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
