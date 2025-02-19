import 'package:flutter/material.dart';
import 'package:levlly/extensions/num_extensions.dart';
import 'package:levlly/screens/calculator/widgets/appbar/export.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/export.dart';

class MarksAppbar extends StatefulWidget {
  const MarksAppbar({super.key, required this.marks, required this.changeGoalScore, required this.goalScore});

  final List<String> marks;
  final ValueChanged<String> changeGoalScore;
  final String goalScore;

  @override
  State<MarksAppbar> createState() => _MarksAppbarState();
}

class _MarksAppbarState extends State<MarksAppbar> {
  @override
  Widget build(BuildContext context) {
    final int marksSum = widget.marks.fold(0, (sum, element) => sum + int.parse(element));
    final int marksCount = widget.marks.length;
    final num grade = (marksSum/(marksCount != 0 ? marksCount : 1)).cutNumber(2);


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlockTextButton(
          value: marksCount.toString(), 
          onPressed: (){},
          width: AppDimensions.appBarBlockWidth,
          height: AppDimensions.appBarBlockHeight
        ),
        CircularProgressWithText(value: grade, size: AppDimensions.appBarCircularSize),
        MarkInputBlock(
          defaultGoalScore: widget.goalScore, 
          changeGoalScore: widget.changeGoalScore, 
          width: AppDimensions.appBarBlockWidth,
          height: AppDimensions.appBarBlockHeight
        )
      ]
    );
  }
}