import 'dart:async';

import 'package:flutter/material.dart';

class GridAnimator extends StatefulWidget {
  const GridAnimator({
    required this.child,
    required this.time,
    Key? key,
  }) : super(key: key);

  final Widget child;

  final Duration time;

  @override
  GridAnimatorState createState() => GridAnimatorState();
}

class GridAnimatorState extends State<GridAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Timer timer;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);
    timer = Timer(widget.time, controller.forward);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - (animation.value as double)) * 60),
          child: child,
        );
      },
    );
  }
}

Timer? timer;
Duration duration = const Duration();

Duration wait() {
  if (timer == null || !timer!.isActive) {
    timer = Timer(const Duration(microseconds: 120), () {
      duration = Duration.zero;
    });
  }
  return duration += const Duration(milliseconds: 100);
}

class GridAnimatorWidget extends StatelessWidget {
  const GridAnimatorWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GridAnimator(time: wait(), child: child);
  }
}

