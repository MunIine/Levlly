import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/export.dart';

class BottomMarksBar extends StatelessWidget {
  const BottomMarksBar({super.key, required this.markAdd});

  final ValueChanged<int> markAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.bottomMarksBarPadding),
      child: ItemBlock(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (int index){
            final int value = (5-index);
            return Draggable<int>(
              data: value,
              feedback: Opacity(
                opacity: 0.75,
                child: BlockTextButton(
                  value: value.toString(), 
                  onPressed: (){}, 
                  useBackgroundColorScheme: true, 
                  color: AppColors.textColor,
                  elevation: 0,
                ),
              ),
              child: BlockTextButton(
                value: value.toString(), 
                onPressed: () => markAdd(value), 
                useBackgroundColorScheme: true, 
                color: AppColors.textColor,
                elevation: 0,
                width: AppDimensions.bottomMarksBarSize,
                height: AppDimensions.bottomMarksBarSize,
              ),
            );
          }) 
        ),
      ),
    );
  }
}