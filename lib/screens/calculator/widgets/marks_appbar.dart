import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/widgets/export.dart';

class MarksAppbar extends StatelessWidget {
  const MarksAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlockTextButton(
          value: "5", 
          onPressed: (){},
          width: 90,
          height: 65,
          color: AppColors.alternativeTextColor,
        ),
        const CircularProgressWithText(value: 2.5, size: 80),
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