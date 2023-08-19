import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class SocialIcons extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool isGoogleIcon;
  const SocialIcons(
      {Key? key,
      required this.onTap,
      required this.child,
      this.isGoogleIcon = false})
      : super(key: key);

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons>
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
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            height: 50.h,
            width: 50.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.isGoogleIcon ? AppColors.kOrange : null,
              border: widget.isGoogleIcon
                  ? null
                  : Border.all(color: AppColors.kLine),
              borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
