import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/widgets/home_page/bottom_navbar.dart';
import 'package:prueba_final_flutter/widgets/home_page/continue_reading.dart';
import 'package:prueba_final_flutter/widgets/home_page/custom_scroll.dart';
import 'package:prueba_final_flutter/widgets/home_page/header.dart';
import 'package:prueba_final_flutter/widgets/home_page/more_books.dart';
import 'package:prueba_final_flutter/widgets/home_page/searchbar.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

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
        _buildSection(screenSize, 0.15, Header()),
        _buildSection(screenSize, 0.10, CustomSearchBar()),
        _buildSection(screenSize, 0.05, MoreBooks()),
        _buildSection(screenSize, 0.33, CustomScroll()),
        _buildSection(screenSize, 0.25, ContinueReading()),
        _buildSection(screenSize, 0.12, BottomNavbar()),
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
