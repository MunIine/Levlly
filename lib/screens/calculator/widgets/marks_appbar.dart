import 'package:flutter/material.dart';
import 'package:levlly/extensions/num_extensions.dart';
import 'package:levlly/screens/calculator/widgets/appbar/export.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/export.dart';

class MarksAppbar extends StatefulWidget {
  const MarksAppbar({super.key, required this.marks, required this.changeGoalScore, required this.goalScore, required this.clearMarks});

  final List<int> marks;
  final ValueChanged<String> changeGoalScore;
  final VoidCallback clearMarks;
  final String goalScore;

  @override
  State<MarksAppbar> createState() => _MarksAppbarState();
}

class _MarksAppbarState extends State<MarksAppbar> {
  @override
  Widget build(BuildContext context) {
    final int marksSum = widget.marks.fold(0, (sum, element) => sum + element);
    final int marksCount = widget.marks.length;
    final num grade = (marksSum/(marksCount != 0 ? marksCount : 1)).cutNumber(2);


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlockTextButton(
          value: marksCount.toString(), 
          onPressed: () => clearConfirmationDialog(),
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

  void clearConfirmationDialog(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.blockBackgroundColor,
          content: const Text(
            "Вы уверены, что хотите очистить журнал?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.alternativeTextColor,
              fontSize: AppDimensions.fontSize-10,
              fontWeight: AppDimensions.fontWeight
            )
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.blockItemsBackgroundColor)
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    "Нет", 
                    style: TextStyle(
                      color: AppColors.alternativeTextColor,
                      fontSize: AppDimensions.fontSize-10,
                      fontWeight: AppDimensions.fontWeight
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.blockItemsBackgroundColor)
                  ),
                  onPressed: () {
                    widget.clearMarks();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Да", 
                    style: TextStyle(
                      color: AppColors.alternativeTextColor,
                      fontSize: AppDimensions.fontSize-10,
                      fontWeight: AppDimensions.fontWeight
                    ),
                  ),
                ),
              ],
            )
          ]
        );
      },
    );
  }
}