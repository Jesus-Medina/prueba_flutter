import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';

class ReadCustomAppbar extends StatelessWidget {
  const ReadCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
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
                  "Read",
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
