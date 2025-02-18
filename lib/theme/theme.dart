import 'package:flutter/material.dart';
import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.blockBackgroundColor),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      elevation: const WidgetStatePropertyAll(6),
      shadowColor: const WidgetStatePropertyAll(AppColors.shadowColor)
    )
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: Colors.transparent
  )
);