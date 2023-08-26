import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/tracking/screens/tracking_detail.dart';
import 'package:ngamar/features/tracking/screens/widgets/custom_stepper.dart';

class TrackingOrder extends StatelessWidget {
  const TrackingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tracking',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: AppSpacing.twentyVertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.kLine),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.kTruckDelivery),
                      SizedBox(width: AppSpacing.twentyHorizontal),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#19984442MPX',
                            style:
                                AppTypography.kBold18.copyWith(fontSize: 14.sp),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'On Progress',
                            style: AppTypography.kSemiBold12
                                .copyWith(color: AppColors.kBlue),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: AppColors.kGrey70,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimate delivery',
                            style: AppTypography.kMedium14.copyWith(
                              color: AppColors.kGrey80,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'July 29, 2022',
                            style: AppTypography.kBold18
                                .copyWith(fontSize: 14..sp),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipment',
                            style: AppTypography.kMedium14.copyWith(
                              color: AppColors.kGrey80,
                              fontSize: 12..sp,
                            ),
                          ),
                          Text(
                            'DHL Express',
                            style: AppTypography.kBold18
                                .copyWith(fontSize: 14.0.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.twentyVertical),
                  CustomOutlinedButton(
                    onTap: () {
                      Get.to<Widget>(() => const TrackingDetail());
                    },
                    text: 'Receipt Payment',
                    color: AppColors.kPrimary,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.thirtyVertical),
            Text(
              'Delivery Status',
              style: AppTypography.kSemiBold16,
            ),
            const CustomStepper(),
          ],
        ),
      ),
    );
  }
}
