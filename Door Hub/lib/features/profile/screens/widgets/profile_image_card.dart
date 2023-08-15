import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? textColor;
  const ProfileImageCard({this.textColor, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSpacing.radiusThirty,
            backgroundImage: AssetImage(AppAssets.kProfilePic),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hab',
                style: AppTypography.kMedium15.copyWith(
                  color: textColor ??
                      (isDarkMode(context)
                          ? AppColors.kWhite
                          : AppColors.kWhite),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'hab@gmail.com',
                style: AppTypography.kLight14.copyWith(color: AppColors.kHint),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
