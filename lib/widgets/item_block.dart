import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';

class ItemBlock extends StatelessWidget {
  const ItemBlock({
    super.key, 
    required this.child, 
    this.elevation = 6, 
    this.borderRadius = 12, 
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
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
    );
  }
}