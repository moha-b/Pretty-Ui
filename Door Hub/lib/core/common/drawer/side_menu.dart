import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_typography.dart';

class SideMenu extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String icon;
  final bool isSelected;
  const SideMenu(
      {super.key,
      this.isSelected = false,
      this.onPressed,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          width: isSelected ? 240.w : 0,
          height: 50.h,
          left: 0,
          child: Container(
            width: 10.w,
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(10.r)),
          ),
        ),
        ListTile(
          onTap: onPressed,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          dense: true,
          minLeadingWidth: 10.w,
          leading: SizedBox(
            width: 28.w,
            height: 28.h,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.kPrimary : AppColors.kWhite,
                  BlendMode.srcIn),
            ),
          ),
          title: Text(
            text,
            style: AppTypography.kMedium15.copyWith(
              color: isSelected ? AppColors.kPrimary : AppColors.kWhite,
            ),
          ),
        ),
      ],
    );
  }
}
