import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/data/data.dart';
import 'package:prueba_final_flutter/screens/detail_book_page.dart';

class CustomScroll extends StatelessWidget {
  const CustomScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productsJson.length,
      itemBuilder: (context, index) {
        final product = productsJson[index];
        return LayoutBuilder(
          builder: (context, constraints) {
            return builCard(context, constraints, product);
          },
        );
      },
    );
  }

  Widget builCard(BuildContext context, BoxConstraints constraints,
      Map<String, dynamic> product) { 
    final productID = product["id"];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailBookPage()),
        );
      },
      child: SizedBox(
        // Define un ancho fijo para cada tarjeta
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
              child: Image.asset(
                product["image"],
                fit: BoxFit.cover,
                height: constraints.maxHeight * 0.7,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product["author"],
                  style: TextStyle(color: Colors.grey[700], fontSize: 11),
                ),
                SizedBox(
                  width: constraints.maxHeight * 0.463,
                  child: Text(
                    product["title"],
                    style: TextStyle(color: Colors.black, fontSize: 15),

                    maxLines: 1, // Limita el texto a una línea
                    overflow: TextOverflow
                        .ellipsis, // Muestra "..." si el texto es demasiado largo
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
