import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class CustomTrackingColumn extends StatelessWidget {
  final String heading;
  final String info;
  const CustomTrackingColumn({
    required this.heading,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: AppTypography.kMedium14.copyWith(
            color: AppColors.kGrey80,
            fontSize: 12.sp,
          ),
        ),
        Text(
          info,
          style: AppTypography.kBold18.copyWith(fontSize: 14..sp),
        ),
      ],
    );
  }
}
