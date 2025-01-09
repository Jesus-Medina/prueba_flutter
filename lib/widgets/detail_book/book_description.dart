import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_buy.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_description_text.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_price.dart';
import 'package:prueba_final_flutter/widgets/detail_book/book_description/book_rate.dart';

class BookDescription extends StatelessWidget {
  final ProductModel product;

  const BookDescription({
    super.key,
    required this.product,
  });

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
        builder: (context, constraints) => _buildContentSections(constraints),
      ),
    );
  }

  Widget _buildContentSections(BoxConstraints constraints) {
    return Column(
      children: [
        _buildSection(constraints, 0.35, BookPrice(product: product)),
        _buildSection(constraints, 0.16, BookRate(/* implementar rating, idioma y cantidad de paginas en bloc*/)),
        _buildSection(constraints, 0.23, BookDescriptionText(product: product)),
        _buildSection(constraints, 0.26, BookBuy(/*implementar gestor de cantidad*/)),
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
}