import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';

class FeaturesComparisonWidget extends StatelessWidget {
  FeaturesComparisonWidget({
    super.key,
  });
  List<String> textList = [
    'Unlimited Hacks',
    'Personalized content',
    'Collection challenges',
    'Unlimited boards',
    'Streak repair'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      child: Row(children: [
        SizedBox(
          width: 139.w,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 4.w, right: 8.w),
              child: Text(
                'What you get',
                style: TextStyle(
                  color: AppColor.kWhiteColor,
                  fontSize: 14.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 17.h)
                  .copyWith(
                top: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                      textList.length,
                      (index) => Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              textList[index].capitalize.toString(),
                              style: TextStyle(
                                color: AppColor.kLightAccentColor,
                                fontSize: 14.sp,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )),
                ],
              ),
            ),
          ]),
        ),
        Container(
          padding: EdgeInsets.zero,
          width: 77.w,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15.5.w,
                right: 25.5.w,
                top: 0.h,
                bottom: 16.h,
              ),
              child: Text(
                'Free',
                style: TextStyle(
                  color: AppColor.kWhiteColor,
                  fontSize: 14.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h)
                  .copyWith(top: 7),
              child: Column(
                children: [
                  Text(
                    'Limited',
                    style: TextStyle(
                      color: AppColor.kLightAccentColor,
                      fontSize: 14.sp,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ...List.generate(
                      4,
                      (index) => Padding(
                            padding: EdgeInsets.only(top: 13.h),
                            child: SvgPicture.asset(AppIcons.kCancelIcon),
                          ))
                ],
              ),
            ),
          ]),
        ),
        Container(
          padding: EdgeInsets.zero,
          width: 116.w,
          decoration: BoxDecoration(
              color: AppColor.kBackGroundColor,
              border: Border.all(
                color: AppColor.kPrimary,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
              child: Container(
                height: 25.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: AppColor.kPrimary,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Text(
                  'Premium',
                  style: TextStyle(
                    color: AppColor.kLightAccentColor,
                    fontSize: 14.sp,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                children: [
                  ...List.generate(
                      4,
                      (index) => Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: SvgPicture.asset(AppIcons.kTickIcon),
                          )),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    '1/month',
                    style: TextStyle(
                      color: AppColor.kLightAccentColor,
                      fontSize: 12.sp,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
