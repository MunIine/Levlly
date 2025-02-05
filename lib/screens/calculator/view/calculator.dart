import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/export.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    const double contentPadding = 12;

    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: contentPadding),
        child: Column(
          children: [
            SizedBox(height: 50),
            MarksAppbar()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: contentPadding),
        child: BottomMarksBar(),
      )
    );
  }
}