import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';
import 'package:prueba_final_flutter/widgets/more_book/book_list.dart';
import 'package:prueba_final_flutter/widgets/more_book/more_custom_appbar.dart';

class MoreBookPage extends StatefulWidget {
  final List<ProductModel> products;
  const MoreBookPage({super.key, required this.products});

  @override
  State<MoreBookPage> createState() => _MoreBookPageState();
}

class _MoreBookPageState extends State<MoreBookPage> {
  bool _showDeleteButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: BlocBuilder<EcommerceBloc, EcommerceState>(
        builder: (context, state) {
          return _buildContentSections(context, state.products);
        },
      ),
    );
  }

  Widget _buildContentSections(BuildContext context, List<ProductModel> products) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildSection(
          screenSize,
          0.113,
          MoreCustomAppbar(
            onMoreTap: () {
              setState(() {
                _showDeleteButtons = !_showDeleteButtons;
              });
            },
          ),
        ),
        _buildSection(
          screenSize,
          0.88,
          BookList(
            products: products, // Usar los productos del state
            showDeleteButtons: _showDeleteButtons,
          ),
        ),
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
