import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';

class DottedPlaceholder extends StatelessWidget {
  const DottedPlaceholder({
    super.key, 
    this.size = 60, 
    this.dashPattern = const [4, 9]
  });

  final double size;
  final List<double> dashPattern;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 5,
      color: AppColors.placeholder,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      dashPattern: dashPattern,
      radius: const Radius.circular(12),
      child: SizedBox(
        width: size,
        height: size,
      )
    );
  }
}