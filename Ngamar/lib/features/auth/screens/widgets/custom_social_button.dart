import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class CustomSocialButton extends StatefulWidget {
  final String icon;
  final VoidCallback onTap;
  const CustomSocialButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  State<CustomSocialButton> createState() => _CustomSocialButtonState();
}

class _CustomSocialButtonState extends State<CustomSocialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          height: 48.h,
          width: 72.w,
          padding: EdgeInsets.all(1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusFive),
            color: const Color(0xFFF6F6F6),
            image: DecorationImage(image: AssetImage(widget.icon)),
          ),
        ),
      ),
    );
  }
}
