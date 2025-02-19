import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';

class ItemBlock extends StatelessWidget {
  const ItemBlock({
    super.key, 
    required this.child, 
    this.elevation = AppDimensions.elevation, 
    this.borderRadius = AppDimensions.itemBlockBorderRadius, 
    this.shadowColor = AppColors.shadowColor
  });

  final Widget child;
  final double elevation;
  final double borderRadius;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: shadowColor,
      color: AppColors.blockBackgroundColor,
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
    );
  }
}