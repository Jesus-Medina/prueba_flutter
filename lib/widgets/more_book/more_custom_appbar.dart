import 'package:flutter/material.dart';

class MoreCustomAppbar extends StatelessWidget {
  const MoreCustomAppbar({super.key});

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
              child: Center(
                child: Text(
                  "More Book",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
