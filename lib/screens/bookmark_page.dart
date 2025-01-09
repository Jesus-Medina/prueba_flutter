import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/widgets/bookmarks_page/bookmark_custom_appbar.dart';
import 'package:prueba_final_flutter/widgets/bookmarks_page/bookmark_listview.dart';

class BookmarkPage extends StatelessWidget {
  final List<ProductModel> favorites;
  const BookmarkPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContentSections(context, favorites),
    );
  }
}

Widget _buildContentSections(BuildContext context, List<ProductModel> favorites) {
  final Size screenSize = MediaQuery.of(context).size;

  return Column(
    children: [
      _buildSection(screenSize, 0.113, BookmarkCustomAppbar()),
      _buildSection(screenSize, 0.887, BookmarkListview(favorites: favorites)),
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
