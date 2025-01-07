import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/widgets/more_book/book_list.dart';
import 'package:prueba_final_flutter/widgets/more_book/more_custom_appbar.dart';

class MoreBookPage extends StatelessWidget {
  const MoreBookPage({super.key});

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
        _buildSection(screenSize, 0.113, MoreCustomAppbar()),
        _buildSection(screenSize, 0.88, BookList()),
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
