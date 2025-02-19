import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';

class BlockTextButton extends StatelessWidget {
  const BlockTextButton({
    super.key, 
    this.value,
    required this.onPressed,
    this.useTextColorScheme = false,
    this.useBackgroundColorScheme = false,
    this.width, 
    this.height,
    this.elevation,
    this.color = AppColors.alternativeTextColor, 
    this.backgroundColor, 
    this.child, 
  }) : assert(value != null || child != null, "Either value or child must be provided");

  final String? value;
  final VoidCallback? onPressed;
  final Widget? child;
  final bool useTextColorScheme;
  final bool useBackgroundColorScheme;
  final double? width;
  final double? height;
  final double? elevation;
  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: !useBackgroundColorScheme ?
          WidgetStatePropertyAll(backgroundColor) :
          WidgetStatePropertyAll(AppColors.getColor(double.parse(value!))),
          elevation: WidgetStatePropertyAll(elevation)
        ),
        child: child ?? Text(
          value!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.fontSize,
            fontWeight: AppDimensions.fontWeight,
            color: !useTextColorScheme ? color : AppColors.getColor(double.parse(value!))
          ),
        )
      ),
    );
  }
}