// custom_scroll.dart
import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:prueba_final_flutter/screens/detail_book_page.dart';

class CustomScroll extends StatelessWidget {
  final List<ProductModel> products;

  const CustomScroll({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        final product = products[index];
        return LayoutBuilder(
          builder: (context, constraints) {
            return builCard(context, constraints, product);
          },
        );
      },
    );
  }

  Widget builCard(
      BuildContext context, BoxConstraints constraints, ProductModel product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailBookPage(product: product)),
        );
      },
      child: SizedBox(
        width: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: constraints.maxHeight * 0.7,
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.author,
                  style: TextStyle(color: Colors.grey[700], fontSize: 11),
                ),
                SizedBox(
                  width: constraints.maxHeight * 0.463,
                  child: Text(
                    product.title,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
