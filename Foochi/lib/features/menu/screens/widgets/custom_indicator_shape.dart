import 'package:flutter/material.dart';

class BoxTabIndicator extends Decoration {
  final double width;
  final Color color;

  const BoxTabIndicator({
    required this.width,
    required this.color,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _BoxTabIndicatorPainter(this, onChanged);
  }
}

class _BoxTabIndicatorPainter extends BoxPainter {
  final BoxTabIndicator decoration;

  _BoxTabIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()..color = decoration.color;
    final Rect indicatorRect = Rect.fromLTWH(rect.left, rect.bottom - 2,
        decoration.width, 2); // Adjust the height of the indicator here

    canvas.drawRect(indicatorRect, paint);
  }
}
