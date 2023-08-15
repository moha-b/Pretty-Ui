import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../dividers/custom_vertical_divider.dart';

class CustomHeaderText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? fontColor;
  const CustomHeaderText(
      {required this.text, this.fontSize, this.fontColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomVerticalDivider(
          color: AppColors.kSecondary,
          height: 20.h,
          width: 4.w,
        ),
        SizedBox(width: 5.w),
        Text(text,
            style: AppTypography.kBold24
                .copyWith(fontSize: fontSize ?? 24.sp, color: fontColor))
      ],
    );
  }
}
