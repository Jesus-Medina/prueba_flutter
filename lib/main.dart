import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/screens/bloc/ecommerce_bloc.dart';
import 'package:prueba_final_flutter/screens/home_page.dart';

void main() {
  runApp(const EcommerceApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EcommerceBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Prueba Final Flutter",
        home: HomePage(),
      ),
    );
  }
}
