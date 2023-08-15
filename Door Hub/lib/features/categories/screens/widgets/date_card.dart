import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';

class DateCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  final String icon;
  final Color? color;
  const DateCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color,
          border: color == null ? Border.all(color: AppColors.kHint) : null,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SvgPicture.asset(icon),
          SizedBox(width: 14.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.kLight12),
              SizedBox(height: 4.h),
              Text(subtitle, style: AppTypography.kMedium15),
            ],
          )
        ]),
      ),
    );
  }
}
