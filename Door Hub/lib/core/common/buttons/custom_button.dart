import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/utils.dart';
import '../animations/button_animation.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;
  final bool isBorder;
  const CustomButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onTap,
      this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: isDarkMode(context)
                ? AppColors.kContentColor
                : AppColors.kWhite,
            borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
            border: isBorder ? Border.all(color: AppColors.kHint) : null),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTypography.kLight12.copyWith(
                  color: isDarkMode(context)
                      ? AppColors.kWhite
                      : AppColors.kPrimary),
            ),
            SizedBox(width: 5.w),
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                  isDarkMode(context) ? AppColors.kWhite : AppColors.kPrimary,
                  BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}
