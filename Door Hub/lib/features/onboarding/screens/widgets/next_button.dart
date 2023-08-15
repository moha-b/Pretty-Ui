import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animations/button_animation.dart';
import '../../../../core/utils/app_colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  const NextButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: const BoxDecoration(
            color: AppColors.kPrimary, shape: BoxShape.circle),
        child: Icon(
          Icons.navigate_next,
          size: 30.w,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
