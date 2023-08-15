import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animations/button_animation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;
  const SkipButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.kAccent4,
          ),
          child: Text(
            'Skip',
            style: AppTypography.kLight14.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
