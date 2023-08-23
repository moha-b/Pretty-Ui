import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Select the type of book you enjoy reading.',
          style: TextStyle(
            color: AppColor.kLightAccentColor,
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 19.w,
        )
      ],
    );
  }
}
