import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateCard extends StatelessWidget {
  final bool selectedIndex;
  final VoidCallback onTap;
  const DateCard({required this.onTap, required this.selectedIndex, super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: selectedIndex
              ? AppColors.kPrimary
              : isDarkMode(context)
                  ? Colors.black
                  : AppColors.kWhite,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '2',
              style: AppTypography.kBold16.copyWith(
                color: selectedIndex ? AppColors.kWhite : AppColors.kSecondary,
              ),
            ),
            Text(
              'Mon',
              style: AppTypography.kBold16.copyWith(
                fontSize: 16.sp,
                color: selectedIndex ? AppColors.kWhite : AppColors.kSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
