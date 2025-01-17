import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';
import 'package:prueba_final_flutter/widgets/home_page/bottom_navbar.dart';
import 'package:prueba_final_flutter/widgets/home_page/continue_reading.dart';
import 'package:prueba_final_flutter/widgets/home_page/custom_scroll.dart';
import 'package:prueba_final_flutter/widgets/home_page/header.dart';
import 'package:prueba_final_flutter/widgets/home_page/loading.dart';
import 'package:prueba_final_flutter/widgets/home_page/more_books.dart';
import 'package:prueba_final_flutter/widgets/home_page/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: BlocProvider.value(
        value: context.read<EcommerceBloc>()..add(LoadProductsEvent()),
        child: _buildContentSections(context),
      ),
    );
  }

  Widget _buildContentSections(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                _buildSection(screenSize, 0.15, Header(cartItems: state.cart)),
                _buildSection(screenSize, 0.10, const CustomSearchBar()),
                _buildSection(
                    screenSize, 0.05, MoreBooks(products: state.products)),
                state.homeScreenState == HomeScreenState.loading
                    ? _buildSection(screenSize, 0.33, Loading())
                    : _buildSection(screenSize, 0.33,
                        CustomScroll(products: state.products)),
                if (state.currentNavIndex == 1)
                  _buildSection(screenSize, 0.37, const ContinueReading()),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildSection(
                screenSize,
                0.11,
                BottomNavbar(
                  products: state.products,
                  favorites: state.favorites,
                ),
              ),
            ),
          ],
        );
      },
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
