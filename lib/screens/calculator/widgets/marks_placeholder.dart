import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/marks_grid/export.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/export.dart';

class MarksPlaceholder extends StatefulWidget {
  const MarksPlaceholder({super.key, required this.marks, required this.markAdd});

  final List<String> marks;
  final ValueChanged<String> markAdd;

  @override
  State<MarksPlaceholder> createState() => _MarksPlaceholderState();
}

class _MarksPlaceholderState extends State<MarksPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return ItemBlock(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.placeholderPadding),
        child: DragTarget<String>(
          builder: (context, candidateData, rejectedData) {
            return DoubleGridView(marks: widget.marks);
          },
          onAcceptWithDetails:(details) => widget.markAdd(details.data),
        )
      )
    );
  }
}