import 'package:flutter/material.dart';

class HeartAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  const HeartAnimationWidget({
    super.key,
    required this.child,
    required this.isAnimating,
    required this.duration,
    this.onEnd,
  });

  @override
  State<HeartAnimationWidget> createState() => _HeartAnimationWidgetState();
}

class _HeartAnimationWidgetState extends State<HeartAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;

  @override
  void initState() {
    final halfDuration = widget.duration.inMilliseconds;
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: halfDuration));

    scale = Tween<double>(begin: 1, end: 1.2).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HeartAnimationWidget oldWidget) {
    if (widget.isAnimating != oldWidget.isAnimating) {
      doAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future doAnimation() async {
    if (widget.isAnimating) {
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(const Duration(milliseconds: 400));
      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
