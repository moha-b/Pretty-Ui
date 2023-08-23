import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/utils.dart';

class BookNowCard extends StatelessWidget {
  const BookNowCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, top: 32.h),
      child: Container(
        padding: EdgeInsets.only(left: 16.w),
        width: 358.w,
        height: 201.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            image: DecorationImage(
                image: AssetImage(AppImagePath.kCardBackground))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 76.w),
                child: Text(
                  ' Get unlimited access to books in just ',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kLightAccentColor,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              Text(
                '\$9.99',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kPrimary,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                ' *Terms & conditions apply',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.kLightAccentColor,
                  fontFamily: 'Inter',
                ),
              )
            ]),
      ),
    );
  }
}
