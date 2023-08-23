import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class InstructionText extends StatelessWidget {
  const InstructionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Select 3 or more genres to continue',
      style: TextStyle(
        color: AppColor.kLightAccentColor,
        fontSize: 12.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
