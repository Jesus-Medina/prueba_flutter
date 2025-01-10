import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';
import 'package:prueba_final_flutter/screens/detail_book_page.dart';

class BookList extends StatelessWidget {
  final List<ProductModel> products;
  final bool showDeleteButtons;

  const BookList({
    super.key,
    required this.products,
    required this.showDeleteButtons,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      alignment: Alignment.center,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 7,
          childAspectRatio:
              160 / 270, // Ajusta la proporción de aspecto del hijo
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildBookItem(context, products[index]);
        },
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, ProductModel product) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (!showDeleteButtons) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBookPage(
                    product: product,
                  ),
                ),
              );
            }
          },
          child: Center(
            child: Container(
              width: 160, // Establece el ancho deseado de la tarjeta
              height: 270, // Establece el alto deseado de la tarjeta
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground,
                border: Border.all(
                  color: AppColors.buttonBlack,
                  width: 0.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                        image: DecorationImage(
                          image: NetworkImage(product.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FractionallySizedBox(
                      widthFactor: 0.95,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            product.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FractionallySizedBox(
                      widthFactor: 0.95,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            product.author,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDeleteButtons)
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                context.read<EcommerceBloc>().add(
                      DeleteBookLocallyEvent(product: product),
                    );
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
