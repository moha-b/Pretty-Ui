import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../data/categories.dart';

class FoodCategoryCard extends StatelessWidget {
  final VoidCallback onTap;
  final DishCategory categories;
  final bool isSelected;
  const FoodCategoryCard(
      {super.key,
      required this.onTap,
      required this.categories,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            categories.image,
            height: 45.h,
            fit: BoxFit.fitHeight,
          ),
          const Spacer(),
          Text(categories.name,
              style:
                  isSelected ? AppTypography.kBold14 : AppTypography.kLight14)
        ],
      ),
    );
  }
}
