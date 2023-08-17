import 'package:animate_do/animate_do.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/categaory.dart';
import 'custom_chips.dart';

class FascinateView extends StatefulWidget {
  final Function(List<Category>?)? onChanged;
  const FascinateView({required this.onChanged, super.key});

  @override
  State<FascinateView> createState() => _FascinateViewState();
}

class _FascinateViewState extends State<FascinateView> {
  List<Category> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120.h),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Center(
              child: Text(
                'What fascinates you?',
                style: AppTypography.kBold32,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.tenVertical),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Center(
              child: Text(
                'To give you a personalized experience,\nlet us know your interests.',
                textAlign: TextAlign.center,
                style: AppTypography.kLight16,
              ),
            ),
          ),
          SizedBox(height: 70.h),
          Center(
            child: Wrap(
              spacing: 15.w,
              runSpacing: 20.h,
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(
                categoriesList.length,
                (index) => CustomChips(
                  onTap: () {
                    if (selectedCategories.contains(categoriesList[index])) {
                      selectedCategories.remove(categoriesList[index]);
                    } else {
                      selectedCategories.add(categoriesList[index]);
                      widget.onChanged!(selectedCategories);
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
        ],
      ),
    );
  }
}
