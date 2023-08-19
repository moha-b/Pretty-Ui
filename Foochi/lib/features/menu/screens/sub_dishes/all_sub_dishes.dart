import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../../../home/data/categories.dart';
import '../../../home/screens/widgets/food_dish_card.dart';
import '../../controller/food_dish_controller.dart';
import '../../data/food_dish.dart';

class AllSubDishes extends StatefulWidget {
  final DishCategory category;
  const AllSubDishes({super.key, required this.category});

  @override
  State<AllSubDishes> createState() => _AllSubDishesState();
}

class _AllSubDishesState extends State<AllSubDishes> {
  int selectedCard = 0;
  FoodDishController dc = Get.find<FoodDishController>();
  @override
  Widget build(BuildContext context) {
    final filteredDishes =
        foodDishes.where((dish) => dish.category == widget.category).toList();

    print(widget.category.name);
    print(filteredDishes.length);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Swiper(
          curve: Curves.easeIn,
          itemBuilder: (BuildContext context, int index) {
            return FoodDishCard(
              dishes: filteredDishes[index],
            );
          },
          index: 0,
          fade: 0,
          itemCount: filteredDishes.length,
          itemWidth: double.maxFinite,
          itemHeight: 427.h,
          layout: SwiperLayout.TINDER,
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text('Recommended', style: AppTypography.kBold18),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 20.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                return Container(
                  width: 247.w,
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.kLine2)),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.kFoodImage1,
                          height: 65.h, width: 65.w),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Barbecue & Pepper Full Set',
                                style: AppTypography.kExtraLight14),
                            Text(r'$12.00',
                                style: AppTypography.kMedium14.copyWith(
                                    fontSize: 13.sp,
                                    color: AppColors.kLightBrown)),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, i) => SizedBox(width: 10.w),
              itemCount: 2),
        )
      ],
    );
  }
}
