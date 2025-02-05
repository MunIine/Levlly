import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';

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
              backgroundColor: const Color(0xFFF5F4F1),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.getColor(value)),
            ),
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 23,
            color: AppColors.getColor(value),
            fontWeight: FontWeight.w800,
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