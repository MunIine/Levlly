import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';

class DottedPlaceholder extends StatelessWidget {
  const DottedPlaceholder({
    super.key, 
    this.size = AppDimensions.dottedPlaceholderSize,
    this.strokeWidth = AppDimensions.dottedPlaceholderBorder,
    this.dashPattern = AppDimensions.dottedDashPattern
  });

  final double size;
  final double strokeWidth;
  final List<double> dashPattern;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.dottedPlaceholderPadding),
      child: DottedBorder(
        strokeWidth: strokeWidth,
        color: AppColors.placeholder,
        strokeCap: StrokeCap.round,
        borderType: BorderType.RRect,
        dashPattern: dashPattern,
        radius: const Radius.circular(AppDimensions.dottedPlaceholderBorderRadius),
        child: SizedBox(
          width: size-9,
          height: size-9,
        )
      ),
    );
  }
}