import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';

class ItemBlock extends StatelessWidget {
  const ItemBlock({
    super.key, 
    required this.child, 
    this.elevation = AppDimensions.elevation, 
    this.borderRadius = AppDimensions.itemBlockBorderRadius, 
    this.shadowColor = AppColors.shadowColor,
    this.horizontalPadding = AppDimensions.itemBlockHorizontalPadding,
    this.verticalPadding = AppDimensions.itemBlockVerticalPadding,
    this.color,
  });

  final Widget child;
  final double elevation;
  final double borderRadius;
  final Color shadowColor;
  final double verticalPadding;
  final double horizontalPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: shadowColor,
      color: color ?? AppColors.blockBackgroundColor,
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding).copyWith(left: horizontalPadding).copyWith(right: horizontalPadding),
        child: child,
      ),
    );
  }
}