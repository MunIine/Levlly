import 'package:flutter/material.dart';
import 'package:levlly/extensions/num_extensions.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/widgets/export.dart';

class MarksAppbar extends StatefulWidget {
  const MarksAppbar({super.key, required this.marks});

  final List<String> marks;

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
          width: 90,
          height: 65,
          color: AppColors.alternativeTextColor,
        ),
        CircularProgressWithText(value: grade, size: 80),
        BlockTextButton(
          value: "3.6", 
          onPressed: (){},
          width: 90,
          height: 65,
          useTextColorScheme: true,
        )
      ]
    );
  }
}