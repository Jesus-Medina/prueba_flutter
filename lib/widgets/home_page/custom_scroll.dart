import 'package:flutter/material.dart';

class CustomScroll extends StatelessWidget {
  const CustomScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 20),
          LayoutBuilder(
            builder: (context, constraints) => builCard(constraints),
          ),
          SizedBox(width: 20),
          LayoutBuilder(
            builder: (context, constraints) => builCard(constraints),
          ),
          SizedBox(width: 20),
          LayoutBuilder(
            builder: (context, constraints) => builCard(constraints),
          ),
          SizedBox(width: 20),
          LayoutBuilder(
            builder: (context, constraints) => builCard(constraints),
          ),
          SizedBox(width: 20),
          LayoutBuilder(
            builder: (context, constraints) => builCard(constraints),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget builCard(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45, // Color de la sombra
                blurRadius: 1, // Desenfoque de la sombra
                offset: Offset(0, 0), // Desplazamiento horizontal y vertical
              ),
            ],
          ),
          child: Image.asset(
            "assets/images/book.jpg",
            fit: BoxFit.cover,
            height: constraints.maxHeight * 0.7,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "by Erich From",
          style: TextStyle(color: Colors.grey[700], fontSize: 11),
        ),
        Text(
          "El Arte De Amar",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ],
    );
  }
}
