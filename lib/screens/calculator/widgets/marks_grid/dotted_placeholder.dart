import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';

class DottedPlaceholder extends StatelessWidget {
  const DottedPlaceholder({
    super.key, 
    this.size = 60,
    this.strokeWidth = 5,
    this.dashPattern = const [4.1, 9]
  });

  final double size;
  final double strokeWidth;
  final List<double> dashPattern;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: DottedBorder(
        strokeWidth: strokeWidth,
        color: AppColors.placeholder,
        strokeCap: StrokeCap.round,
        borderType: BorderType.RRect,
        dashPattern: dashPattern,
        radius: const Radius.circular(12),
        child: SizedBox(
          width: size-9,
          height: size-9,
        )
      ),
    );
  }
}