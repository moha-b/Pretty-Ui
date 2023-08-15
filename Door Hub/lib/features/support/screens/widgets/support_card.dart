import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const SupportCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PrimaryContainer(
          child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.kMedium16),
              SizedBox(height: 5.h),
              Text(subtitle,
                  style:
                      AppTypography.kLight14.copyWith(color: AppColors.kHint)),
            ],
          )
        ],
      )),
    );
  }
}
