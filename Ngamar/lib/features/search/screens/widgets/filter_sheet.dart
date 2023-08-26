import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/search/screens/widgets/star_rating_card.dart';

import '../../../explore/screens/widgets/product_type_card.dart';


class FilterSheet extends StatefulWidget {
  final void Function(ProductCategory category, double price, int starRating)
      onApplyFilters;
  const FilterSheet({required this.onApplyFilters, super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int selectedType = 0;
  int selectedStarRating = 0;
  double currentFilerPrice = 1260.0;
  String formatProductCategory(ProductCategory category) {
    final categoryString = category.toString().split('.').last;
    return categoryString.replaceAll('_', ' ').capitalizeFirst.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 634.h,
      padding: EdgeInsets.only(
        top: 10.h,
        left: 24.w,
        right: 24.0.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDivider(),
          SizedBox(height: AppSpacing.twentyVertical),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back<void>();
                },
                icon: const Icon(Icons.close),
              ),
              Text(
                'Filter',
                style: AppTypography.kSemiBold18,
              ),
              const Spacer(),
              CustomTextButton(
                onPressed: () {},
                text: 'Reset Filters',
                color: AppColors.kPrimary,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Text(
            'Categories',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Wrap(
            spacing: 10.0.w,
            runSpacing: 10.0.h,
            children: List.generate(
              ProductCategory.values.length,
              (index) => ProductTypeCard(
                onTap: () {
                  setState(() {
                    selectedType = index;
                  });
                },
                isSelected: selectedType == index,
                type: formatProductCategory(ProductCategory.values[index]),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Text(
            'Price',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 12.h,
              activeTrackColor: AppColors.kPrimary,
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              value: currentFilerPrice,
              min: 260,
              max: 12000,
              label: currentFilerPrice.toInt().toString(),
              thumbColor: AppColors.kWhite,
              onChanged: (value) {
                setState(() {
                  currentFilerPrice = value;
                });
              },
            ),
          ),
          Row(
            children: [
              Text(
                r'$260',
                style: AppTypography.kSemiBold12
                    .copyWith(color: AppColors.kGrey70, fontSize: 12.sp),
              ),
              const Spacer(),
              Text(
                r'$12000',
                style: AppTypography.kSemiBold12
                    .copyWith(color: AppColors.kGrey70),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Text(
            'Star Rating',
            style: AppTypography.kSemiBold18,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.0..h,
            children: List.generate(
              starRating.length,
              (index) => StarRatingCard(
                onTap: () {
                  setState(() {
                    selectedStarRating = index;
                  });
                },
                isSelected: selectedStarRating == index,
                rating: starRating[index],
              ),
            ),
          ),
          const Spacer(),
          PrimaryButton(
            onTap: () {
              final selectedCategory = ProductCategory.values[selectedType];
              final selectedPrice = currentFilerPrice;
              final selectedRating = starRating[selectedStarRating];
              widget.onApplyFilters(
                selectedCategory,
                selectedPrice,
                selectedRating,
              );
              Get.back<void>();
            },
            text: 'Apply Filters',
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 7.h,
        width: 74.w,
        decoration: BoxDecoration(
          color: AppColors.kGrey30,
          borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
