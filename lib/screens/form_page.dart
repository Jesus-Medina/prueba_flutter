import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
      ),
      backgroundColor: Colors.white,
      body: _buildContentSections(context),
    );
  }

  Widget _buildContentSections(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildSection(screenSize, 0.92984, Container(color: Colors.red)),
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
