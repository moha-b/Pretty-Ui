import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/common/common.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/orders/screens/widgets/animated_rider.dart';
import 'package:get/get.dart';

import '../../chat_call/screens/courier_call_view.dart';
import '../../chat_call/screens/courier_chat_view.dart';
import '../../home/screens/widgets/profile_image_card.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            image: DecorationImage(
                image: AssetImage(AppAssets.kMap), fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.kLightPink2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('DELIVERY TIME', style: AppTypography.kLight11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('15:38',
                      style: AppTypography.kBold24
                          .copyWith(color: AppColors.kPrimary)),
                  Text(' min', style: AppTypography.kLight14),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(AppAssets.kFoochi),
                            SvgPicture.asset(AppAssets.kDistance),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        const DottedDivider(
                          color: AppColors.kOrange,
                        ),
                        SizedBox(height: 3.h),
                      ],
                    ),
                    const AnimatedRider(),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text('Distance from you',
                  style: AppTypography.kExtraLight13
                      .copyWith(color: AppColors.kLightBrown)),
              Text(
                '04:30 - 1,2km',
                style: AppTypography.kExtraLight13
                    .copyWith(color: AppColors.kOrange),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.only(
                    top: 20.h, left: 10.w, right: 10.w, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.kLightPink),
                child: Row(
                  children: [
                    const ProfileImageCard(),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('David Jame', style: AppTypography.kMedium14),
                        Row(
                          children: [
                            Image.asset(AppAssets.kStarFilled, height: 20.h),
                            Text(
                              '5.0',
                              style: AppTypography.kLight11,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomIconButton(
                        onTap: () {
                          Get.to(() => const CourierChatView());
                        },
                        icon: AppAssets.kChat),
                    SizedBox(width: 10.w),
                    CustomIconButton(
                        onTap: () {
                          Get.to(() => const CourierCallView());
                        },
                        icon: AppAssets.kCall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
