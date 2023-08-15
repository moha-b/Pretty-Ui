import 'package:door_hub/features/home/data/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/common/animations/button_animation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../sub_category_screen.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final bool isGridView;
  const CategoryCard(
      {required this.category, this.isGridView = false, super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: () {
        Get.to(() => SubCategoryView(
              category: category,
            ));
      },
      child: Column(
        children: [
          Container(
            height: isGridView ? 72.h : 58.h,
            width: isGridView ? 72.h : 58.h,
            alignment: Alignment.center,
            padding: EdgeInsets.all(18.h),
            decoration: BoxDecoration(
              color: category.color,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(category.image),
          ),
          SizedBox(height: 12.h),
          Text(category.name, style: AppTypography.kLight13),
        ],
      ),
    );
  }
}

class CategorySeeAllButton extends StatelessWidget {
  final VoidCallback onTap;
  const CategorySeeAllButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return ButtonAnimation(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 58.h,
            width: 58.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDarkMode(context)
                  ? AppColors.kContentColor
                  : const Color(0xFFECECEC),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 12.h),
          Text('See All', style: AppTypography.kLight13),
        ],
      ),
    );
  }
}
