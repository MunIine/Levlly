import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/marks_grid/export.dart';
import 'package:levlly/widgets/export.dart';

class MarksPlaceholder extends StatefulWidget {
  const MarksPlaceholder({super.key, required this.marks, required this.markAdd, required this.markRemoveAt});

  final List<int> marks;
  final ValueChanged<int> markAdd;
  final ValueChanged<int> markRemoveAt;

  @override
  State<MarksPlaceholder> createState() => _MarksPlaceholderState();
}

class _MarksPlaceholderState extends State<MarksPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return ItemBlock(
      child: DragTarget<int>(
        builder: (context, candidateData, rejectedData) {
          return DoubleGridView(marks: widget.marks, markRemoveAt: widget.markRemoveAt);
        },
        onAcceptWithDetails:(details) => widget.markAdd(details.data),
      )
    );
  }
}