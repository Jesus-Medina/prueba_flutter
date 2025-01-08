import 'package:flutter/material.dart';

class BookBuy extends StatelessWidget {
  const BookBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.7,
      alignment: Alignment(0, -0.2),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Container(
              color: Colors.grey[200],
              width: constraints.maxWidth * 0.55,
              height: constraints.maxHeight * 0.65, // 45% del ancho del padre
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "QTY",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  Icon(Icons.remove),
                  Text(
                    "1",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.teal,
                    ),
                  ),
                  Icon(Icons.add),
                ],
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: constraints.maxWidth *
                        0.35, // Esto hace que tome todo el ancho disponible
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        // BLOC (evento) => productID
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          // Aquí va tu función cuando se presione el botón
                        },
                        style: ElevatedButton.styleFrom(
                          
                          backgroundColor:
                              Color(0xFFFF7052), // Color naranja del botón
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Bordes redondeados
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
