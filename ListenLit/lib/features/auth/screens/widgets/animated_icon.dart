import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class AnimatedIconWidgets extends StatefulWidget {
  const AnimatedIconWidgets({super.key});

  @override
  _AnimatedIconWidgetsState createState() => _AnimatedIconWidgetsState();
}

class _AnimatedIconWidgetsState extends State<AnimatedIconWidgets>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Animation duration of 1 minute
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void startRotationAnimation() {
    if (!_controller!.isAnimating) {
      _controller!.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        startRotationAnimation();
      },
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: -1.0).animate(_controller!),
        child: Icon(
          Icons.rotate_left_rounded,
          color: AppColor.kPrimary,
          size: 26.sp,
        ),
      ),
    );
  }
}
