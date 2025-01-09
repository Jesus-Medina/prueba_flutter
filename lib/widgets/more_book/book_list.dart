import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/detail_book_page.dart';

class BookList extends StatelessWidget {
  final List<ProductModel> products;
  const BookList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.90,
      heightFactor: 1,
      child: ListView.builder(
        itemCount: (products.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int startIndex = index * 2;
          return Container(
            margin: EdgeInsets.only(top: 40, left: 36, right: 36),
            child: Row(
              children: [
                SizedBox(height: 24),
                _buildBookItem(context, startIndex), // Pasamos context aquí
                SizedBox(width: 42),
                if (startIndex + 1 < products.length)
                  _buildBookItem(context, startIndex + 1) // Y aquí
                else
                  Expanded(child: Container()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, int index) {
    // Agregamos context como parámetro
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailBookPage(
                      product: products[index],
                    )),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: NetworkImage(products[index].image),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              products[index].title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              products[index].author,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
