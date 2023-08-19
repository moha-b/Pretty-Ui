import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashSpacing;
  final double height;

  const DottedDivider({super.key, 
    this.color = Colors.black,
    this.thickness = 1.0,
    this.dashLength = 5.0,
    this.dashSpacing = 3.0,
    this.height = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: CustomPaint(
        painter: _DottedDividerPainter(
          color: color,
          thickness: thickness,
          dashLength: dashLength,
          dashSpacing: dashSpacing,
        ),
      ),
    );
  }
}

class _DottedDividerPainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashSpacing;

  _DottedDividerPainter({
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.dashSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final dashCount = size.width ~/ (dashLength + dashSpacing);
    final dashSpace = (size.width - (dashLength * dashCount)) / dashCount;

    final path = Path();
    for (var i = 0; i < dashCount; i++) {
      final startX = (dashLength + dashSpace) * i;
      path.moveTo(startX, size.height / 2);
      path.lineTo(startX + dashLength, size.height / 2);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DottedDividerPainter oldDelegate) {
    return color != oldDelegate.color ||
        thickness != oldDelegate.thickness ||
        dashLength != oldDelegate.dashLength ||
        dashSpacing != oldDelegate.dashSpacing;
  }
}
