import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/utils/utils.dart';

class InterestCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  const InterestCard({
    required this.onTap,
    required this.text,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? AppColors.kPrimary : AppColors.kLine,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Icon(
                Icons.check,
                color: AppColors.kPrimary,
                size: 16,
              )
            else
              const SizedBox(),
            SizedBox(width: AppSpacing.fiveHorizontal),
            Text(
              text,
              style: AppTypography.kMedium14.copyWith(
                color: isSelected ? AppColors.kPrimary : AppColors.kGrey100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
