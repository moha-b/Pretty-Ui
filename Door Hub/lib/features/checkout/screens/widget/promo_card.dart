import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSelected;
  const PromoCard({super.key, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 55.h,
            width: 55.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kLime,
            ),
            child: SvgPicture.asset(AppAssets.kPromoCode),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Service HUB 21', style: AppTypography.kMedium16),
                SizedBox(height: 5.h),
                Text(
                  'You will get 20% discount for this promo code.',
                  style: AppTypography.kLight13
                      .copyWith(color: AppColors.kNeutral),
                ),
              ],
            ),
          ),
          Container(
            height: 20.h,
            width: 20.w,
            padding: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.kPrimary, width: 2.w),
              shape: BoxShape.circle,
            ),
            child: isSelected
                ? Container(
                    decoration: const BoxDecoration(
                        color: AppColors.kPrimary, shape: BoxShape.circle),
                  )
                : null,
          )
        ],
      ),
    );
  }
}
