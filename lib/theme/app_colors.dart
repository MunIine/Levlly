import 'package:flutter/material.dart';

class AppColors{
  static const List<Color> marks = [
    Color(0xFFA1A1A1),
    Color(0xFF536456),
    Color(0xFFDA5E4E),
    Color(0xFFEC9549), 
    Color(0xFF63B9E5), 
    Color(0xFF54C669)
  ];
  static const Color backgroundColor = Color(0xFFFFFEFB);
  static const Color blockBackgroundColor = Color(0xFFF5F4F1);
  static const Color blockItemsBackgroundColor = Color(0xFFE9E9E9);
  static const Color selected = Color(0xFFDCDCDC);
  static const Color placeholder = Color(0xFFD8D8D8);
  static const Color alternativeTextColor = Color(0xFFA1A1A1);
  static const Color textColor = Colors.white;
  static const Color shadowColor = Color(0xCC000000);
  static const Color splashEffectColor = Color(0xACCDCDCD);

  static Color getColor(num value) => marks[value.round()];
}