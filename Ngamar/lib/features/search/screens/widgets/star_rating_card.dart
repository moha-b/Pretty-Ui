import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';

class StarRatingCard extends StatelessWidget {
  final bool isSelected;
  final int rating;
  final VoidCallback onTap;

  const StarRatingCard({
    required this.isSelected,
    required this.onTap,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.kPrimary : AppColors.kLine,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            rating,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: SvgPicture.asset(AppAssets.kStar),
            ),
          ),
        ),
      ),
    );
  }
}
