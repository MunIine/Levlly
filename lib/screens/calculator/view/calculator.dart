import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/export.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final double contentPadding = 12;
  
  final List<String> marks = [];
  String goalScore = "3.5"; // Стандартный желаемый балл

  void markAdd(String value){
    if(marks.length == 999) return; // Может быть какой-то алерт о превышении
    setState(() {
      marks.add(value);
    });
  }

  void changeGoalScore(String value){
    setState(() {
      goalScore = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: contentPadding),
        child: Column(
          children: [
            const SizedBox(height: 50),
            MarksAppbar(marks: marks, goalScore: goalScore, changeGoalScore: changeGoalScore,),
            const SizedBox(height: 30),
            MarksPlaceholder(marks: marks, markAdd: markAdd),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: contentPadding),
        child: BottomMarksBar(markAdd: markAdd),
      )
    );
  }
}