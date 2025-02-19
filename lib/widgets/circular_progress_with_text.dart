import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';

class CircularProgressWithText extends StatelessWidget {
  const CircularProgressWithText({super.key, required this.value, required this.size});

  final num value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: ShadowCircularPainter(),
            child: CircularProgressIndicator(
              value: value / 5,
              strokeWidth: 16,
              strokeCap: StrokeCap.round,
              backgroundColor: AppColors.blockBackgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.getColor(value)),
            ),
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: AppDimensions.circularFontSize,
            fontWeight: AppDimensions.circularFontWeight,
            color: AppColors.getColor(value),
          )
        ),
      ],
    );
  }
}

class ShadowCircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}