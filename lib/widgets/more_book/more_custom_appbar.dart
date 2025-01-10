import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';

class MoreCustomAppbar extends StatefulWidget {
  final VoidCallback onMoreTap;
  const MoreCustomAppbar({super.key, required this.onMoreTap});

  @override
  MoreCustomAppbarState createState() => MoreCustomAppbarState();
}

class MoreCustomAppbarState extends State<MoreCustomAppbar> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onMoreTap();
  }

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
            Container(
              decoration: BoxDecoration(
                color: _isSelected
                    ? Colors.black12
                    : Colors
                        .transparent, // Cambia el color de fondo cuando está seleccionado
                shape: BoxShape.circle, // Hace que el contenedor sea circular
              ),
              child: IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors
                      .black, // Cambia el color del icono cuando está seleccionado
                ),
                onPressed: _toggleSelection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
