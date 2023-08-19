import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class DottedCircleContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color dotColor;

  const DottedCircleContainer({
    Key? key,
    required this.child,
    required this.radius,
    required this.dotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedCirclePainter(dotColor: dotColor, radius: radius),
      child: Container(
        width: radius * 2,
        height: radius * 2,
        padding: EdgeInsets.all(10.h),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class _DottedCirclePainter extends CustomPainter {
  final Color dotColor;
  final double radius;

  const _DottedCirclePainter({required this.dotColor, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final double dotRadius = 2.0;
    final Paint paint = Paint()
      ..color = dotColor
      ..strokeWidth = dotRadius
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    for (double i = 0; i < 360; i += 15) {
      double angle = i * math.pi / 180;
      double startX = centerX + radius * math.cos(angle);
      double startY = centerY + radius * math.sin(angle);
      double endX = centerX + (radius - dotRadius) * math.cos(angle);
      double endY = centerY + (radius - dotRadius) * math.sin(angle);

      path.moveTo(startX, startY);
      path.lineTo(endX, endY);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

