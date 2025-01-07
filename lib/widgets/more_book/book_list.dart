import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/screens/detail_book_page.dart';

class BookList extends StatelessWidget {
  BookList({super.key});

  final List<Map<String, String>> books = List.generate(
      16,
      (index) => index % 2 == 0
          ? {
              'title': 'El Arte De Amar',
              'author': 'Erich Fromm',
              'imageUrl': 'assets/images/book.jpg',
            }
          : {
              'title': 'El Arte De Amar',
              'author': 'Erich Fromm',
              'imageUrl': 'assets/images/book.jpg',
            });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.90,
      heightFactor: 1,
      child: ListView.builder(
        itemCount: (books.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int startIndex = index * 2;
          return Container(
            margin: EdgeInsets.only(top: 40, left: 36, right: 36),
            child: Row(
              children: [
                SizedBox(height: 24),
                _buildBookItem(context, startIndex), // Pasamos context aquí
                SizedBox(width: 42),
                if (startIndex + 1 < books.length)
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
            MaterialPageRoute(builder: (context) => DetailBookPage()),
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
                    image: AssetImage(books[index]['imageUrl']!),
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
              books[index]['title']!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              books[index]['author']!,
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
