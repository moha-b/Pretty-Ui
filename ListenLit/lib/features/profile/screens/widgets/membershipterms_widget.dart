import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/utils.dart';

class MembershipTermsWidget extends StatelessWidget {
  const MembershipTermsWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 32.5.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 17.w,
          ),
          child: SizedBox(
            width: 358.w,
            child: Text(
              title,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: AppColor.kLightAccentColor,
                  fontSize: 12.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 17.w,
            top: 8.h,
          ),
          child: Container(
            width: 358.w,
            padding: EdgeInsets.only(right: 17.w),
            child: Text(
              subTitle,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: AppColor.kLightAccentColor,
                  fontSize: 12.sp,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }
}
