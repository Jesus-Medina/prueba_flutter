import 'package:flutter/material.dart';

class PhotoContainer extends StatelessWidget {
  const PhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: FractionallySizedBox(
        alignment: Alignment(0, 0),
        heightFactor: 0.7,
        widthFactor: 0.4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 25,
                spreadRadius: 1,
              ),
            ],
            image: DecorationImage(
              image: AssetImage("assets/images/book.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
