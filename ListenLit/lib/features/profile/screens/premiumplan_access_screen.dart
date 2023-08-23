import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';

import '../../../core/common/primarybutton.dart';

class PremiumplansAccessScreen extends StatelessWidget {
  const PremiumplansAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBGColor,
      body: Padding(
        padding: EdgeInsets.only(top: 113.h, left: 16.w, right: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(left: 126.w, right: 136.w),
            child: SvgPicture.asset(
              AppImagePath.kSuccessPremiumAccess,
              width: 128.w,
              height: 128.h,
              color: AppColor.kLightAccentColor,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
            width: 358.w,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'We’re giving you Premium access for 3 days, for free',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.kLightAccentColor,
                        fontSize: 24.sp,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w500,
                        height: 1.5.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Unlimited insights from books, courses documentaries, and podcasts.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.kLightAccentColor,
                      fontSize: 16.sp,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
          ),
          const Spacer(),
          PrimaryButton(
            onTap: () {
              Get.close(4);
            },
            text: 'Continue',
            textColor: AppColor.kWhiteColor,
            bgColor: AppColor.kPrimary,
            borderRadius: 0.r,
          ),
          SizedBox(
            height: 52.h,
          )
        ]),
      ),
    );
  }
}
