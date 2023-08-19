import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../../../../core/common/buttons/primary_button.dart';
import '../../../../core/common/divider/custom_divider.dart';
import '../../../home/data/categories.dart';
import '../../controller/search_controller.dart';
import '../../data/cuisine.dart';
import 'category_chip.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int selectedCategory = 0;
  int selectedCuisine = 0;
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: AppColors.kLightPink,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomDivider(),
          SizedBox(height: 20.h),
          Center(
            child: Text('Filters',
                style: AppTypography.kBold24
                    .copyWith(color: AppColors.kSecondary)),
          ),
          SizedBox(height: 13.h),
          Text('Categories', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          Wrap(
            runSpacing: 10.w,
            spacing: 10.w,
            children: List.generate(
                dishCategories.length,
                (index) => CategoryChip(
                    onTap: () {
                      selectedCategory = index;
                      setState(() {});
                    },
                    text: dishCategories[index].name,
                    isSelected: selectedCategory == index)),
          ),
          SizedBox(height: 20.h),
          Text('Cuisine', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          Wrap(
            runSpacing: 10.w,
            spacing: 10.w,
            children: List.generate(
                cuisines.length,
                (index) => CategoryChip(
                    onTap: () {
                      selectedCuisine = index;
                      setState(() {});
                    },
                    text: cuisines[index].name,
                    isSelected: selectedCuisine == index)),
          ),
          SizedBox(height: 20.h),
          Text('Price', style: AppTypography.kBold18),
          SizedBox(height: 10.h),
          RangeSlider(
            values: _currentRangeValues,
            max: 100,
            divisions: 5,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          SizedBox(height: 50.h),
          PrimaryButton(
            onTap: () {
              KSearchController searchController =
                  Get.find<KSearchController>();
              searchController.selectedCategory.value =
                  dishCategories[selectedCategory];
              searchController.selectedCuisine.value =
                  cuisines[selectedCuisine];
              searchController.priceRange.value = _currentRangeValues;
              searchController.applyFilters();
              Get.back<void>();
            },
            text: 'Filter',
          )
        ],
      ),
    );
  }
}
