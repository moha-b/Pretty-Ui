import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class PopularSearchCard extends StatelessWidget {
  const PopularSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 71.h,
          width: 71.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage(AppAssets.kDummyProduct1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokin Bed',
              style: AppTypography.kSemiBold16,
            ),
            Text(
              '1,6k Search today',
              style: AppTypography.kLight10.copyWith(color: AppColors.kGrey60),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.kError.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'Hot',
            style: AppTypography.kSemiBold12.copyWith(color: AppColors.kError),
          ),
        ),
      ],
    );
  }
}
