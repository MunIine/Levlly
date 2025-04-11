import 'package:flutter/material.dart';

class AppDimensions{
  bool initialized = false;

  // All font
  static const double fontSize = 30;
  static const FontWeight fontWeight = FontWeight.w700;

  // All
  static const double elevation = 6;
  static const double borderRadius = 12;
  static const double bodyPadding = 12;

  // Item block
  static const double itemBlockBorderRadius = 12;
  static const double itemBlockVerticalPadding = 12;
  static const double itemBlockHorizontalPadding = 15;

  // View more button
  static const double moreButtonSize = 60;
  static const double moreButtonBorder = 5;
  static const double moreButtonBorderRadius = 12;
  static const double moreButtonIconSize = 42;

  // Dotted placeholder
  static const List<double> dottedDashPattern = [4.1, 9];
  static const double dottedPlaceholderSize = 60;
  static const double dottedPlaceholderPadding = 2.5;
  static const double dottedPlaceholderBorder = 5;
  static const double dottedPlaceholderBorderRadius = 12;
  
  // Mark input block font
  static const double markInputFontSize = 30;
  static const FontWeight markInputFontWeight = FontWeight.w700;
  static const int markInputMaxLenght = 4;


  // Circular progress text
  static const FontWeight circularFontWeight = FontWeight.w800;


  // Appbar
  static const double appBarBlockWidth = 90;
  static const double appBarBlockHeight = 65;
  static const double appBarCircularSize = 80;

  // Marks grid
  static const double gridItemSize = 53;
  static double gridHorizontalItemPadding = 19;
  static double gridVerticalItemPadding = 15;

  // Marks select
  static const double selectIconSize = 30;
  static const double selectItemSize = 53;
  static const double selectItemElevation = 3;

  // Bottom bar
  static const double bottomMarksBarPadding = 12;
  static const double bottomMarksBarSize = 56;

  static void init(BuildContext context) {
    if (AppDimensions().initialized) return;
    AppDimensions().initialized = true;
    
    final double width = MediaQuery.of(context).size.width;

    final rowWidth = width-bodyPadding*2-itemBlockHorizontalPadding*2;
    gridHorizontalItemPadding = (rowWidth-gridItemSize*5)/4;
  }
}