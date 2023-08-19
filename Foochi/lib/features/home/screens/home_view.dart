import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/features/home/screens/widgets/food_categories_card.dart';
import 'package:foochi/features/home/screens/widgets/food_dish_card.dart';
import 'package:get/get.dart';

import '../../../core/common/texts/heading_rich_text.dart';
import '../../menu/controller/food_dish_controller.dart';
import '../data/categories.dart';

class HomeView extends StatelessWidget {
  final FoodDishController dc = Get.put(FoodDishController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<FoodDishController>(
          init: FoodDishController(),
          builder: (dc) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: const HeadingRichText(
                      text1: 'Specials\n',
                      text2: 'Menu Offers\nFor You',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 75.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20.w),
                      itemBuilder: (ctx, i) {
                        return FoodCategoryCard(
                          onTap: () {
                            dc.filterDishesByCategory(dishCategories[i]);
                          },
                          isSelected: dc.selectedCategory == dishCategories[i],
                          categories: dishCategories[i],
                        );
                      },
                      separatorBuilder: (ctx, i) => SizedBox(width: 30.w),
                      itemCount: dishCategories.length,
                    ),
                  ),
                  Swiper(
                    curve: Curves.easeIn,
                    itemBuilder: (BuildContext context, int index) {
                      return FoodDishCard(dishes: dc.filteredDishes[index]);
                    },
                    fade: 0,
                    itemCount: dc.filteredDishes.length,
                    itemWidth: double.maxFinite,
                    itemHeight: 437.h,
                    layout: SwiperLayout.TINDER,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
