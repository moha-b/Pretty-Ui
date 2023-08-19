import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../../../features/menu/data/food_dish.dart';
import '../../../features/menu/data/ingredients.dart';
import '../buttons/custom_icon_button.dart';
import '../buttons/primary_button.dart';
import '../divider/custom_divider.dart';
import '../divider/custom_dotted_divider.dart';

class ToppingAddedDialog extends StatelessWidget {
  final FoodDish dish;
  const ToppingAddedDialog({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.kLightPink2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDivider(),
            SizedBox(height: 20.h),
            Text('Toppings Added', style: AppTypography.kBold24),
            SizedBox(height: 20.h),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                  separatorBuilder: (ctx, i) => SizedBox(height: 10.h),
                  itemCount: dish.ingredients.length,
                  itemBuilder: (ctx, i) {
                    return ToppingsAdded(ingredients: dish.ingredients[i]);
                  }),
            ),
            SizedBox(height: 20.h),
            DottedDivider(
              color: AppColors.kLine2,
              thickness: 1.0,
              dashLength: 3.w,
              dashSpacing: 2.w,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text('Toppings Added', style: AppTypography.kLight14),
                const Spacer(),
                Text(r'$8.00', style: AppTypography.kMedium16),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text('Main Dish', style: AppTypography.kLight14),
                const Spacer(),
                Text('\$${dish.price}', style: AppTypography.kMedium16),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text('Total', style: AppTypography.kLight14),
                const Spacer(),
                Text('\$${dish.price + 8.00}',
                    style: AppTypography.kBold24
                        .copyWith(color: AppColors.kPrimary)),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                CustomIconButton(
                  onTap: () {},
                  icon: AppAssets.kArrowLeft,
                  size: 50.h,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      Get.back();
                    },
                    height: 50.h,
                    borderRadius: 10.r,
                    text: 'Add to Cart',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ToppingsAdded extends StatelessWidget {
  final Ingredient ingredients;
  const ToppingsAdded({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ingredients.image,
          height: 60.h,
          width: 60.w,
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: ingredients.grams.toInt().toString(),
                    style: AppTypography.kBold14
                        .copyWith(color: AppColors.kSecondary),
                    children: [
                  TextSpan(
                      text: 'gr ${ingredients.name}',
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kSecondary))
                ])),
            Text(r'$6.00', style: AppTypography.kLight11),
          ],
        ),
        const Spacer(),
        CustomIconButton(
          icon: AppAssets.kDelete,
          onTap: () {},
        ),
      ],
    );
  }
}
