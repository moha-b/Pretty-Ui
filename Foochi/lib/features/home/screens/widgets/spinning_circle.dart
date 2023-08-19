import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpinningCircle extends StatefulWidget {
  final String image;
  const SpinningCircle({Key? key, required this.image}) : super(key: key);

  @override
  _SpinningCircleState createState() => _SpinningCircleState();
}

class _SpinningCircleState extends State<SpinningCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat();
    _timer = Timer(const Duration(milliseconds: 500), stopAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void stopAnimation() {
    _animationController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationController.value * 2 * pi,
          child: child,
        );
      },
      child: Container(
        height: 250.h,
        width: 250.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(widget.image), fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
