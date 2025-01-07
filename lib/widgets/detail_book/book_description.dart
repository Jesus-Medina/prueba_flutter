import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_buy.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_description_text.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_price.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_rate.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: LayoutBuilder(
          builder: (context, constraints) =>
              _buildContentSections(constraints)),
    );
  }
}

Widget _buildContentSections(BoxConstraints constraints) {
  return Column(
    children: [
      _buildSection(constraints, 0.35, BookPrice()),
      _buildSection(constraints, 0.16, BookRate()),
      _buildSection(constraints, 0.23, BookDescriptionText()),
      _buildSection(constraints, 0.26, BookBuy()),
    ],
  );
}

Widget _buildSection(
    BoxConstraints constraints, double heightFactor, Widget widget) {
  return SizedBox(
    width: constraints.maxWidth,
    height: constraints.maxHeight * heightFactor,
    child: widget,
  );
}
