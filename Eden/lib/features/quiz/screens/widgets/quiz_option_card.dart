import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizOptionCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String options;
  const QuizOptionCard({
    required this.isSelected,
    required this.onTap,
    required this.options,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: isSelected ? 80.h : 60.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isSelected ? AppColors.kPrimary : AppColors.kWhite,
          boxShadow: [AppColors.defaultShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              options,
              style: AppTypography.kBold16.copyWith(
                color: isSelected ? AppColors.kWhite : AppColors.kSecondary,
              ),
            ),
            Transform.scale(
              scale: isSelected ? 1.2 : 1.0,
              child: Container(
                height: 24.h,
                width: 24.w,
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.kSecondary.withOpacity(0.05),
                ),
                child: isSelected
                    ? Icon(
                        Icons.done,
                        color: AppColors.kWhite,
                        size: 16.h,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
