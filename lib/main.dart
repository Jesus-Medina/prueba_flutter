import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Prueba Final Flutter",
      home: HomePage(),
    );
  }
}
