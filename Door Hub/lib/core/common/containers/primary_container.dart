import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? radius;
  final EdgeInsets? padding;
  const PrimaryContainer(
      {required this.child, this.height, this.padding, this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: height,
      padding: padding ?? EdgeInsets.all(16.h),
      decoration: BoxDecoration(
          color: isDarkMode(context)
              ? AppColors.kDarkSurfaceColor
              : AppColors.kWhite,
          borderRadius: BorderRadius.circular(radius ?? 8.r)),
      child: child,
    );
  }
}
