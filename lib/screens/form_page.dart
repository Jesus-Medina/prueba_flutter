import 'package:flutter/material.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/widgets/form_page/form_custom_appbar.dart';
import 'package:prueba_final_flutter/widgets/form_page/my_form.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://plus.unsplash.com/premium_photo-1672944876342-4090164e1c04?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            fit: BoxFit.cover,
          ),
        ),
        child: _buildContentSections(context)),
    );
  }

  Widget _buildContentSections(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildSection(screenSize, 0.113, FormCustomAppbar()),
        _buildSection(screenSize, 0.4, MyForm()),
      ],
    );
  }

  Widget _buildSection(Size screenSize, double heightFactor, Widget widget) {
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height * heightFactor,
      child: widget,
    );
  }
}
