import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class TopLevelTextWidget extends StatelessWidget {
  const TopLevelTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 73.h, right: 138.w, bottom: 15.h, left: 32.w),
      child: Text(
        'Select Genres',
        style: TextStyle(
          fontSize: 32.sp,
          color: AppColor.kLightAccentColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
