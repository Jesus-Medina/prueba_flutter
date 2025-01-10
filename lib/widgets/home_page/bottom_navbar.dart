import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';
import 'package:prueba_final_flutter/screens/bookmark_page.dart';
import 'package:prueba_final_flutter/screens/read_page.dart';

class BottomNavbar extends StatefulWidget {
  final List<ProductModel> products, favorites;
  const BottomNavbar(
      {super.key, required this.products, required this.favorites});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    context.read<EcommerceBloc>().add(UpdateNavIndexEvent(index: index));

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReadPage(product: widget.products[0])),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookmarkPage(favorites: widget.favorites)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: AppColors.primaryBackground,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: BottomNavigationBar(
              currentIndex: state.currentNavIndex,
              onTap: onItemTapped,
              elevation: 0,
              backgroundColor: AppColors.primaryBackground,
              selectedItemColor: AppColors.buttonBlack,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Reading',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: 'Bookmark',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
