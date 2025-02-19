import 'package:flutter/material.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.blockBackgroundColor),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.borderRadius))),
      elevation: const WidgetStatePropertyAll(AppDimensions.elevation),
      shadowColor: const WidgetStatePropertyAll(AppColors.shadowColor),
      overlayColor: WidgetStateProperty.all(AppColors.splashEffectColor)
    )
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: Colors.transparent
  )
);