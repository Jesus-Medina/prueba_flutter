import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/constants/app_colors.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  void _guardarTextos(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Añadir el libro usando el bloc
      context.read<EcommerceBloc>().add(
            AddBookEvent(
              title: _titleController.text,
              author: _authorController.text,
            ),
          );

      // Limpiar los campos
      _titleController.clear();
      _authorController.clear();

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Book added successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.90,
      heightFactor: 0.95,
      alignment: Alignment.center,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    fillColor: AppColors.shadowColor,
                    filled: true,
                    labelText: 'Title',
                    labelStyle: TextStyle(
                        color: AppColors
                            .primaryBackground), // Cambia el color del label
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors
                              .primaryBackground), // Cambia el color del borde
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors
                              .buttonBlack), // Cambia el color del borde cuando está enfocado
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _authorController,
                  decoration: InputDecoration(
                    fillColor: AppColors.shadowColor,
                    filled: true,
                    labelText: 'Author',
                    labelStyle: TextStyle(
                        color: AppColors
                            .primaryBackground), // Cambia el color del label
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors
                              .buttonBlack), // Cambia el color del borde
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors
                              .buttonBlack), // Cambia el color del borde cuando está enfocado
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an author';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () => _guardarTextos(context),
                  child: Text(
                    'Add Book',
                    style: TextStyle(color: AppColors.buttonBlack),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
