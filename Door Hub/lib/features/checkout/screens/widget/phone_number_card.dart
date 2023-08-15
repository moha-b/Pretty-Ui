import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberCard extends StatelessWidget {
  const PhoneNumberCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: AssetImage(AppAssets.kProfilePic),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('+64 012 3456', style: AppTypography.kBold16),
            SizedBox(height: 5.h),
            Text(
              'Primary',
              style: AppTypography.kLight13.copyWith(color: AppColors.kHint),
            )
          ],
        )
      ],
    );
  }
}
