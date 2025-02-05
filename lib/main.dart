import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/view/calculator.dart';
import 'package:levlly/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Levlly',
      theme: theme,
      home: const Calculator()
    );
  }
}