import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/widgets/export.dart';

class BottomMarksBar extends StatelessWidget {
  const BottomMarksBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ItemBlock(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blockBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (int index){
                final String value = (5-index).toString();
                return Draggable(
                  data: value,
                  feedback: Opacity(
                    opacity: 0.75,
                    child: BlockTextButton(
                      value: value, 
                      onPressed: (){}, 
                      useBackgroundColorScheme: true, 
                      color: AppColors.textColor,
                      elevation: 0,
                    ),
                  ),
                  child: BlockTextButton(
                    value: value, 
                    onPressed: (){}, 
                    useBackgroundColorScheme: true, 
                    color: AppColors.textColor,
                    elevation: 0,
                    width: 60,
                    height: 60,
                  ),
                );
              }) 
            ),
          ),
        ),
      ),
    );
  }
}