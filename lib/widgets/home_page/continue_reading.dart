import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';

class ContinueReading extends StatelessWidget {
  const ContinueReading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        color: AppColors.primaryBackground,
        image: DecorationImage(
          image: NetworkImage(
            "https://i.ibb.co/1qBCJ1N/wmremove-transformed-removebg-preview.png",
          ),
          fit: BoxFit.cover,
          alignment: Alignment(-3.5, 0),
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.horizontal_rule,
                  color: AppColors.buttonBlack,
                  size: 30,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continue Reading',
                  style: TextStyle(
                    color: AppColors.buttonBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: AppColors.buttonBlack,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                  color: AppColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/611LVKy2PBL._SL1200_.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'La Mujer Rota',
                          style: TextStyle(
                            color: AppColors.buttonBlack,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.7',
                              style: TextStyle(
                                color: AppColors.buttonBlack,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: 0.65, // 65%
                          backgroundColor: Colors.red[200],
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.buttonRed),
                          strokeWidth: 3,
                        ),
                        Text(
                          '65%',
                          style: TextStyle(
                            color: AppColors.buttonBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
