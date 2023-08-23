import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class TopicContainer extends StatelessWidget {
  final String topsList;
  final bool isSearchOn;

  final Function() onTap;

  const TopicContainer({
    super.key,
    required this.topsList,
    required this.isSearchOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8.0.w,
        bottom: 13.0.h,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
            vertical: 8.0.h,
          ),
          decoration: BoxDecoration(
            color: isSearchOn ? AppColor.kPrimary : AppColor.kSamiDarkColor,
            borderRadius: BorderRadius.circular(8.0.r),
            border: Border.all(
              width: 0.2.w,
              color: isSearchOn
                  ? AppColor.kSamiDarkColor
                  : AppColor.kSamiDarkColor,
            ),
          ),
          child: Text(
            topsList.capitalize.toString(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              color: isSearchOn
                  ? AppColor.kSamiDarkColor
                  : AppColor.kSamiAccentColor,
            ),
          ),
        ),
      ),
    );
  }
}
