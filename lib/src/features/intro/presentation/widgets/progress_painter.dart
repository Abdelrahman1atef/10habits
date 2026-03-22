import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits10/core/theme/app_colors.dart';

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    /// Background dashed circle
    final dashPaint = Paint()
      ..color = AppColors.grey1
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    const dashWidth = 20;
    const dashSpace = 30;
    double startAngle = 0;

    while (startAngle < 2 * 3.1416) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashWidth / radius,
        false,
        dashPaint,
      );
      startAngle += (dashWidth + dashSpace) / radius;
    }

    /// Progress arc
    final progressPaint = Paint()
      ..color = const Color(0xFF2A7F62)
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.1416 / 2,
      2 * 3.1416 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}