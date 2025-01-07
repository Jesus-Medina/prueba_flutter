import 'package:flutter/material.dart';

class BookDescriptionText extends StatelessWidget {
  const BookDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment(0, 1),
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: SingleChildScrollView(
        child: Text(
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. "
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(
            fontSize: 11,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
