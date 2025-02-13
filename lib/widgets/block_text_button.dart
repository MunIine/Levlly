import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';

class BlockTextButton extends StatelessWidget {
  const BlockTextButton({
    super.key, 
    required this.value,
    required this.onPressed,
    this.useTextColorScheme = false,
    this.useBackgroundColorScheme = false,
    this.width, 
    this.height,
    this.elevation,
    this.color, 
    this.backgroundColor, 
  });

  final String value;
  final VoidCallback? onPressed;
  final bool useTextColorScheme;
  final bool useBackgroundColorScheme;
  final double? width;
  final double? height;
  final double? elevation;
  final Color? color;
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
          WidgetStatePropertyAll(AppColors.getColor(double.parse(value))),
          elevation: WidgetStatePropertyAll(elevation)
        ),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: !useTextColorScheme ? color : AppColors.getColor(double.parse(value))
          ),
        )
      ),
    );
  }
}