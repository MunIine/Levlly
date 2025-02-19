import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/widgets/export.dart';

class MarksCountSelect extends StatefulWidget {
  const MarksCountSelect({super.key, required this.updateNumberOfRequiredMarks});

  final ValueChanged<int> updateNumberOfRequiredMarks;

  @override
  State<MarksCountSelect> createState() => _MarksCountSelectState();
}

class _MarksCountSelectState extends State<MarksCountSelect> {
  final double size = 53;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return ItemBlock(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12).copyWith(left: 15).copyWith(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (int index) {
            return BlockTextButton(
              value: index != 4 ? (index+1).toString() : null,
              backgroundColor: selected == index ? AppColors.selected : AppColors.blockItemsBackgroundColor,
              height: size,
              width: size,
              elevation: 3,
              onPressed: (){
                selected = index;
                widget.updateNumberOfRequiredMarks(selected);
              },
              child: index == 4 ? const Icon(
                Icons.edit_rounded,
                color: AppColors.alternativeTextColor,
                size: 30,
              ) : null
            );
          }),
        )
      )
    );
  }
}