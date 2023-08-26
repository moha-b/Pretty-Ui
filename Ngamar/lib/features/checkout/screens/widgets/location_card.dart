import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kLine),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Los Angeles',
                style: AppTypography.kSemiBold16,
              ),
              SizedBox(height: AppSpacing.fiveVertical),
              Text(
                'Los Angeles, United States',
                style: AppTypography.kSemiBold12
                    .copyWith(color: AppColors.kGrey70),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 60.h,
            width: 60.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kPrimary, width: 3.w),
              image: DecorationImage(
                image: AssetImage(AppAssets.kMap),
                fit: BoxFit.cover,
              ),
            ),
            child: SvgPicture.asset(AppAssets.kMapPin),
          ),
        ],
      ),
    );
  }
}
