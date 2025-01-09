import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading Products..."),
        CircularProgressIndicator(),
      ],
    );
  }
}
