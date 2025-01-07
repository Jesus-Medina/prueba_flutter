import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/screens/more_book_page.dart';

class MoreBooks extends StatelessWidget {
  const MoreBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Trending Book",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MoreBookPage()),
              );
            },
            child: Text(
              "Ver más",
              style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
