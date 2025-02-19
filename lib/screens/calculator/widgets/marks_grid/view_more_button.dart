import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key, 
    required this.onPressed,
    this.down = true,
    this.size = AppDimensions.moreButtonSize, 
  });

  final double size;
  final bool down;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const double angle = 90 * 3.14159 / 180;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.moreButtonBorderRadius),
          border: Border.all(
            color: AppColors.placeholder,
            width: AppDimensions.moreButtonBorder
          )
        ),
        child: Center(
          child: Transform.rotate(
            angle: down ? angle * -1 : angle,
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.placeholder,
              size: AppDimensions.moreButtonIconSize,
            ),
          ),
        ),
      ),
    );
  }
}