import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class CategoryChip extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  const CategoryChip(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.kPrimary : null,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: isSelected ? AppColors.kPrimary : AppColors.kLine2)),
        child: Text(text,
            style: AppTypography.kExtraLight13.copyWith(
                color: isSelected ? AppColors.kWhite : AppColors.kLightBrown)),
      ),
    );
  }
}
