import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/utils.dart';

class PremiumPlanOverviewWidget extends StatelessWidget {
  const PremiumPlanOverviewWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334.w,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(
            color: AppColor.kWhiteColor,
            fontSize: 32.sp,
            fontFamily: 'Gotham',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: AppColor.kLightAccentColor,
            fontSize: 16.sp,
            fontFamily: 'Gotham',
            fontWeight: FontWeight.w400,
          ),
        )
      ]),
    );
  }
}
