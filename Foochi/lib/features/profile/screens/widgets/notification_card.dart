import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.kLightPink),
      child: Row(
        children: [
          Image.asset(
            AppAssets.kFoodImage1,
            height: 60.h,
            width: 60.w,
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fried, Mixed Potatoes', style: AppTypography.kExtraLight14),
              Text('Discount 30% all Fried dishes',
                  style: AppTypography.kLight13),
            ],
          )
        ],
      ),
    );
  }
}
