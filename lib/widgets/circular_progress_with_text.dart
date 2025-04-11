import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';

class CircularProgressWithText extends StatelessWidget {
  const CircularProgressWithText({
    super.key, 
    required this.value, 
    required this.size, 
    this.strokeWidth = 16, 
    this.fontSize,
  });

  final num value;
  final double size;
  final double strokeWidth;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: ShadowCircularPainter(strokeWidth: strokeWidth),
            child: CircularProgressIndicator(
              value: value / 5,
              strokeWidth: strokeWidth,
              strokeCap: StrokeCap.round,
              backgroundColor: AppColors.blockBackgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.getColor(value)),
            ),
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: fontSize ?? size * 0.2875,
            fontWeight: AppDimensions.circularFontWeight,
            color: AppColors.getColor(value),
          )
        ),
      ],
    );
  }
}

class ShadowCircularPainter extends CustomPainter {
  const ShadowCircularPainter({
    required this.strokeWidth,
  });
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 0.625;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}