import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/buttons/animated_button.dart';

class CustomMenuCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final String icon;

  const CustomMenuCard({
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AnimatedButton(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? (isDarkMode(context) ? Colors.black : AppColors.kWhite)
                  : (isDarkMode(context)
                      ? Colors.black.withOpacity(0.15)
                      : AppColors.kPrimary.withOpacity(0.15)),
              boxShadow: isSelected ? [AppColors.defaultShadow] : null,
            ),
            child: SvgPicture.asset(icon),
          ),
          SizedBox(height: 10.h),
          Text(title, style: AppTypography.kLight14),
        ],
      ),
    );
  }
}
