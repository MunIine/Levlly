import 'package:flutter/material.dart';
import 'package:levlly/repository/calculator_repository.dart';
import 'package:levlly/screens/calculator/widgets/export.dart';
import 'package:levlly/theme/app_dimensions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<int> marks = [];
  String goalScore = "3.5"; // Стандартный желаемый балл
  int numberOfRequiredMarks = 1;

  void markAdd(int value){
    if(marks.length == 999) return; // Может быть какой-то алерт о превышении
    setState(() {
      marks.add(value);
    });
  }

  void markRemoveAt(int index){
    setState(() {
      marks.removeAt(index);
    });
  }

  void changeGoalScore(String value){
    setState(() {
      goalScore = value;
    });
  }

  void updateNumberOfRequiredMarks(int value){
    setState(() {
      numberOfRequiredMarks = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    CalculatorRepository calculatorRepository = CalculatorRepository(marks: marks, goalScore: goalScore, numberOfRequiredMarks: numberOfRequiredMarks);
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.bodyPadding),
        child: Column(
          children: [
            const SizedBox(height: 50),
            MarksAppbar(marks: marks, goalScore: goalScore, changeGoalScore: changeGoalScore),
            const SizedBox(height: 30),
            MarksPlaceholder(marks: marks, markAdd: markAdd, markRemoveAt: markRemoveAt),
            const SizedBox(height: 20),
            MarksCountSelect(updateNumberOfRequiredMarks: updateNumberOfRequiredMarks),
            const SizedBox(height: 20),
            SolvesList(calculatorRepository: calculatorRepository),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.bodyPadding),
        child: BottomMarksBar(markAdd: markAdd),
      )
    );
  }
}