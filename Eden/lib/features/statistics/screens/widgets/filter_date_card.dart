import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDateCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String text;
  const FilterDateCard({
    required this.isSelected,
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: AppTypography.kBold18,
          ),
          SizedBox(height: 2.h),
          if (isSelected)
            Container(
              height: 6.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.kPrimary,
                borderRadius: BorderRadius.circular(20.r),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
