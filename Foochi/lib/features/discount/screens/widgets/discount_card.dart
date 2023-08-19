import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../menu/data/food_dish.dart';

class DiscountCard extends StatelessWidget {
  final FoodDish dish;
  const DiscountCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(
              image: AssetImage(dish.image), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            dish.name,
            style: AppTypography.kBold18.copyWith(color: AppColors.kSecondary),
          ),
          Text(
            '\$${dish.price}',
            style:
                AppTypography.kMedium16.copyWith(color: AppColors.kLightBrown),
          ),
          SizedBox(height: 20.h),
          Text(
            'Discount up to',
            style: AppTypography.kExtraLight14
                .copyWith(color: AppColors.kSecondary, fontSize: 12.sp),
          ),
          Text(
            '${dish.discount!.toInt()}%',
            style: AppTypography.kBold36.copyWith(color: AppColors.kOrange),
          ),
        ],
      ),
    );
  }
}
