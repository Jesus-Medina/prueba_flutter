import 'package:flutter/material.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          color: Colors.grey[100],
          child: Row(
            children: [
              // Removed mainAxisAlignment.spaceEvenly
              Expanded(
                flex: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rating",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "4.1",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.grey[300],
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Expanded(
                flex: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Number of pages",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "120 pages",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.grey[300],
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Expanded(
                flex: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Languages",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "ENG",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
