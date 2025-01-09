import 'package:flutter/material.dart';

class BookmarkCustomAppbar extends StatelessWidget {
  const BookmarkCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FractionallySizedBox(
        alignment: Alignment(0, 1),
        heightFactor: 0.45,
        widthFactor: 0.95,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Align(
                alignment: Alignment(-0.2, 0),
                child: Text(
                  "Bookmarks",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
