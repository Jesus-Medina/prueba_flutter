import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';

class BookmarkListview extends StatelessWidget {
  final List<ProductModel> favorites;
  const BookmarkListview({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    // Envolvemos el contenido con un BlocBuilder para escuchar los cambios
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        return Container(
          color: Colors.grey[50],
          child: FractionallySizedBox(
            alignment: const Alignment(0, 0),
            heightFactor: 1,
            widthFactor: 1,
            child: ListView.builder(
              itemCount: state
                  .favorites.length, // Usamos state.cart en lugar de cartItems
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(
                    context, index, state.favorites); // Usamos state.cart
              },
            ),
          ),
        );
      },
    );
  }
}

Widget _buildItem(
    BuildContext context, int index, List<ProductModel> favorites) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Row(
      children: [
        const SizedBox(width: 10),
        Container(
          height: 80,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(favorites[index].image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              favorites[index].title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              favorites[index].author,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            alignment: const Alignment(0.8, 0),
            child: GestureDetector(
                onTap: () {
                  context.read<EcommerceBloc>().add(
                        AddToFavoritesProductsEvent(product: favorites[index]),
                      );
                },
                child: Icon(Icons.bookmark, color: Colors.teal)),
          ),
        )
      ],
    ),
  );
}
