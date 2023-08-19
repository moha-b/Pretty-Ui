import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/common/buttons/buttons.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../track_order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: AppColors.kLightPink,
          borderRadius: BorderRadius.circular(30.r)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.kFoodImage1,
                  height: 50.h,
                  width: 50.w,
                ),
                SizedBox(height: 5.h),
                Text('DELIVERY TIME', style: AppTypography.kLight11),
                Text('15:38 min',
                    style: AppTypography.kBold24
                        .copyWith(color: AppColors.kPrimary)),
                SizedBox(height: 5.h),
                Text('Status', style: AppTypography.kLight11),
                Text('On the Way',
                    style: AppTypography.kMedium14
                        .copyWith(color: AppColors.kPrimary)),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Steak',
                  style: AppTypography.kBold14.copyWith(fontSize: 16.sp)),
              Text('#342347',
                  style: AppTypography.kBold14
                      .copyWith(fontSize: 15.sp, color: AppColors.kPrimary)),
              SizedBox(height: 16.h),
              CustomOutlinedButton(
                onTap: () {},
                text: 'Refund',
                height: 40.h,
                width: 125.w,
                borderRadius: 10.r,
              ),
              PrimaryButton(
                onTap: () {
                  Get.to(() => const TrackOrder());
                },
                text: 'Track',
                height: 40.h,
                width: 125.w,
                borderRadius: 10.r,
              )
            ],
          ))
        ],
      ),
    );
  }
}
