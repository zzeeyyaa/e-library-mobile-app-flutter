import 'dart:ui';

import 'package:e_library/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  DashedBorderPainter({
    this.color,
    this.width,
    this.newdashwidth,
    this.newdashSpace,
  });
  final double? width;
  final double? newdashwidth;
  final double? newdashSpace;
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color ?? AppColors.primaryColor
      ..strokeWidth = width ?? 1
      ..style = PaintingStyle.stroke;

    double dashWidth = newdashwidth ?? 5.0;
    double dashSpace = newdashSpace ?? 3.0;
    const double cornerRadius = 10.0;

    final Path path = Path()
      ..moveTo(cornerRadius, 0)
      ..lineTo(size.width - cornerRadius, 0)
      ..arcToPoint(Offset(size.width, cornerRadius),
          radius: const Radius.circular(cornerRadius))
      ..lineTo(size.width, size.height - cornerRadius)
      ..arcToPoint(Offset(size.width - cornerRadius, size.height),
          radius: const Radius.circular(cornerRadius))
      ..lineTo(cornerRadius, size.height)
      ..arcToPoint(Offset(0, size.height - cornerRadius),
          radius: const Radius.circular(cornerRadius))
      ..lineTo(0, cornerRadius)
      ..arcToPoint(const Offset(cornerRadius, 0),
          radius: const Radius.circular(cornerRadius));

    PathMetric pathMetric = path.computeMetrics().first;
    double distance = 0.0;

    while (distance < pathMetric.length) {
      final Path extractPath =
          pathMetric.extractPath(distance, distance + dashWidth);
      canvas.drawPath(extractPath, paint);
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
