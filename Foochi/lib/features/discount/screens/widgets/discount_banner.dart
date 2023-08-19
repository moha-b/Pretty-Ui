import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.h,
      padding: EdgeInsets.all(20.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(
              image: AssetImage(AppAssets.kDiscountBanner), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$0 delivery for\n30 days!',
            style: AppTypography.kBold18.copyWith(color: AppColors.kSecondary),
          ),
          Text(
            'Quick, Quick ...',
            style:
                AppTypography.kExtraLight14.copyWith(color: AppColors.kOrange),
          ),
        ],
      ),
    );
  }
}
