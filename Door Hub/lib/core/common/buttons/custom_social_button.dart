import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/utils.dart';
import '../animations/button_animation.dart';

class CustomSocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  const CustomSocialButton(
      {super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: 55.w,
        alignment: Alignment.center,
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
          color:
              isDarkMode(context) ? AppColors.kDarkHint : AppColors.kNeutral01,
          border: Border.all(
              color: isDarkMode(context)
                  ? AppColors.kDarkInput
                  : AppColors.kNeutral03,
              width: 2.w),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
