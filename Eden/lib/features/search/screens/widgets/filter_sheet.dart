import 'package:eden/core/common/buttons/buttons.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/search/screens/widgets/rating_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../auth/data/categaory.dart';
import '../../../auth/screens/widgets/custom_chips.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  RangeValues _currentRangeValues = const RangeValues(20, 80);
  List<Category> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(AppSpacing.twentyVertical),
          child: CustomIconButton(
            icon: AppAssets.kArrowBackIos,
            onTap: () {
              Get.back<void>();
            },
            color: AppColors.kWhite.withOpacity(0.15),
            iconColor: AppColors.kWhite,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
            color:
                isDarkMode(context) ? AppColors.kSecondary : AppColors.kWhite,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.twentyVertical),
              Row(
                children: [
                  Text('Filter courses', style: AppTypography.kBold24),
                  const Spacer(),
                  CustomTextButton(onPressed: () {}, text: 'Reset All'),
                ],
              ),
              SizedBox(height: 10.h),
              Text('Price', style: AppTypography.kBold18),
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 10,
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
              Row(
                children: [
                  Text(
                    '0\$',
                    style: AppTypography.kBold14.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.kSecondary.withOpacity(0.51),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '1000\$',
                    style: AppTypography.kBold14.copyWith(
                      color: AppColors.kSecondary.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.thirtyVertical),
              Text('Rating', style: AppTypography.kBold18),
              SizedBox(height: AppSpacing.tenVertical),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingCard(
                    icon: AppAssets.kAngry,
                  ),
                  RatingCard(
                    icon: AppAssets.kFrown,
                  ),
                  RatingCard(
                    icon: AppAssets.kNeutral,
                  ),
                  RatingCard(
                    icon: AppAssets.kSmile,
                  ),
                  RatingCard(
                    icon: AppAssets.kHappy,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.twentyVertical),
              Text('Category', style: AppTypography.kBold18),
              SizedBox(height: AppSpacing.tenVertical),
              Center(
                child: Wrap(
                  spacing: 15.w,
                  runSpacing: AppSpacing.twentyVertical,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => CustomChips(
                      onTap: () {
                        if (selectedCategories
                            .contains(categoriesList[index])) {
                          selectedCategories.remove(categoriesList[index]);
                        } else {
                          selectedCategories.add(categoriesList[index]);
                        }
                        setState(() {});
                      },
                      index: index,
                      category: categoriesList[index],
                      isSelected:
                          selectedCategories.contains(categoriesList[index]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              PrimaryButton(
                onTap: () {},
                text: 'Filter',
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ],
    );
  }
}
