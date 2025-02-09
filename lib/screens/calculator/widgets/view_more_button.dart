import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key, 
    required this.onPressed,
    this.size = 60, 
  });

  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DottedBorder(
        strokeWidth: 5,
        strokeCap: StrokeCap.round,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: AppColors.placeholder,
        child: SizedBox(
          height: size,
          width: size,
          child: Center(
            child: Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.placeholder,
                size: 42,
              ),
            ),
          ),
        ),
      ),
    );
  }
}