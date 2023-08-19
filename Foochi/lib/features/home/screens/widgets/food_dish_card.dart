import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../../../../core/common/buttons/custom_icon_button.dart';
import '../../../menu/data/food_dish.dart';
import '../dish_detail_page.dart';
import 'custom_like_button.dart';

class FoodDishCard extends StatelessWidget {
  final FoodDish dishes;
  const FoodDishCard({super.key, required this.dishes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FoodDishDetail(dish: dishes));
      },
      child: Container(
        width: 330.w,
        height: 400.h,
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            color: AppColors.kLightPink,
            borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                    height: 35.h,
                    width: 35.w,
                    child: CustomLikeButton(dish: dishes))),
            Image.asset(
              dishes.image,
              height: 240.h,
              fit: BoxFit.fitHeight,
            ),
            const Spacer(),
            Row(children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishes.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.kBold24
                          .copyWith(color: AppColors.kSecondary, height: 1),
                    ),
                    Text(
                      '\$${dishes.price}',
                      style: AppTypography.kMedium18
                          .copyWith(color: AppColors.kLightBrown),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomIconButton(
                      icon: AppAssets.kAdd,
                      onTap: () {},
                    )),
              )
            ])
          ],
        ),
      ),
    );
  }
}
