
import 'package:flutter/material.dart';
import 'cat/bemen3/m7/camera/ui/t_shirt_calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TShirtCalculatorScreen(),
    );
  }
}
