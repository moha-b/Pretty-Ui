import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isEnabled;
  final String icon;
  final bool isCircle;
  const CustomIconButton(
      {super.key,
      required this.onTap,
      required this.isEnabled,
      required this.icon,
      this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: isEnabled
              ? isDarkMode(context)
                  ? AppColors.kContentColor
                  : Colors.white
              : isDarkMode(context)
                  ? Colors.black
                  : Colors.grey[300],
          borderRadius: BorderRadius.circular(isCircle ? 100.r : 10.r),
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color: isDarkMode(context) ? Colors.black : Colors.grey,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: isDarkMode(context) ? Colors.black : Colors.white,
                    offset: const Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
              isEnabled
                  ? isDarkMode(context)
                      ? AppColors.kWhite
                      : AppColors.kPrimary
                  : Colors.grey,
              BlendMode.srcIn),
        ),
      ),
    );
  }
}
