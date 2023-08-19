import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../../../home/data/categories.dart';
import '../sub_dishes/menu_sub_dishes.dart';

class MainDishesCard extends StatelessWidget {
  final DishCategory categories;
  final int availableDishes;
  const MainDishesCard(
      {super.key, required this.categories, required this.availableDishes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MenuSubDishes(
              categories: categories,
            ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: Container(
          color: AppColors.kLightPink,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories.name,
                      style: AppTypography.kMedium15
                          .copyWith(color: AppColors.kSecondary),
                    ),
                    Text(
                      '$availableDishes Dishes',
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kLightBrown),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: -15,
                right: -20,
                child: Image.asset(
                  categories.image,
                  height: 99.h,
                  width: 140.w,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
