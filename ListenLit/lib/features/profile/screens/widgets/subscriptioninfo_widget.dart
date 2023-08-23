import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';

import '../../../../core/common/primarybutton.dart';

class SubscriptionInfoWidget extends StatelessWidget {
  const SubscriptionInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334.w,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Premium Plan Overview',
          style: TextStyle(
            color: AppColor.kWhiteColor,
            fontSize: 16.sp,
            fontFamily: 'Gotham',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: 342.w,
          decoration: BoxDecoration(
            color: AppColor.kBackGroundColor,
            border: Border.all(color: AppColor.kPrimary, width: 2),
            borderRadius: BorderRadius.circular(
              8.r,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 24.h, left: 113.w, right: 112.w),
              child: Text(
                'Monthly',
                style: TextStyle(
                  color: AppColor.kLightAccentColor,
                  fontSize: 14.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
              ),
              child: Text(
                'Offer Expiries',
                style: TextStyle(
                  color: AppColor.kWhiteColor,
                  fontSize: 18.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 14.w,
                right: 14.w,
                bottom: 24.h,
              ),
              child: Text(
                'Your premium subscription plan ending on 7-19-22. You can renew your plan to enjoy ads free readings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.kLightAccentColor,
                  fontSize: 14.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 32.h,
        ),
        PrimaryButton(
          borderRadius: 4.r,
          onTap: () {},
          text: 'Start 3-day free trail now',
          textColor: AppColor.kWhiteColor,
          bgColor: AppColor.kPrimary,
        ),
        SizedBox(
          height: 15.5.h,
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Center(
            child: Text(
              'NO THANKS',
              style: TextStyle(
                color: AppColor.kLightAccentColor,
                fontSize: 14.sp,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
