import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/double_grid_view.dart';
import 'package:levlly/widgets/export.dart';

class MarksPlaceholder extends StatefulWidget {
  const MarksPlaceholder({super.key});

  @override
  State<MarksPlaceholder> createState() => _MarksPlaceholderState();
}

class _MarksPlaceholderState extends State<MarksPlaceholder> {
  List<int> marks = List.generate(0, (index) => 5);

  @override
  Widget build(BuildContext context) {
    return ItemBlock(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: DoubleGridView(marks: marks)
      )
    );
  }
}