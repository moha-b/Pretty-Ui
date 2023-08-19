import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/utils/utils.dart';

class AnimatedRider extends StatefulWidget {
  const AnimatedRider({Key? key}) : super(key: key);

  @override
  _AnimatedRiderState createState() => _AnimatedRiderState();
}

class _AnimatedRiderState extends State<AnimatedRider>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Adjust the duration here
    );
    _animation = Tween<double>(
      begin: -1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final riderOffset = _animation.value * (screenWidth / 2);
        return Positioned(
          left: 90.w + riderOffset,
          right: 0,
          top: 0.0,
          child: child!,
        );
      },
      child: Column(
        children: [
          SvgPicture.asset(AppAssets.kRider),
          SizedBox(height: 5.h),
          Container(
            height: 8.h,
            width: 8.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kOrange,
            ),
          ),
        ],
      ),
    );
  }
}
