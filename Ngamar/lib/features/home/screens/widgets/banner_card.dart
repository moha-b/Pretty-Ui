import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Stack(
        children: [
          Container(
            height: 160.h,
            width: Get.width,
            padding: EdgeInsets.all(15.h),
            margin: EdgeInsets.only(top: AppSpacing.twentyVertical),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.kSecondary,
              image: DecorationImage(
                image: AssetImage(AppAssets.kBannerMask),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Get',
                    style: AppTypography.kSemiBold16
                        .copyWith(color: AppColors.kWhite),
                    children: [
                      TextSpan(
                        text: ' 50% ',
                        style: AppTypography.kSemiBold16
                            .copyWith(color: AppColors.kPrimary),
                      ),
                      TextSpan(
                        text: 'discount\non sofa purchases',
                        style: AppTypography.kSemiBold16
                            .copyWith(color: AppColors.kWhite, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Check it out',
                        style: AppTypography.kSemiBold14
                            .copyWith(color: AppColors.kWhite),
                      ),
                      SizedBox(width: AppSpacing.fiveHorizontal),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.kWhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 5.w,
            bottom: 5.h,
            child: Image.asset(
              AppAssets.kBannerSofa,
            ),
          ),
        ],
      ),
    );
  }
}
