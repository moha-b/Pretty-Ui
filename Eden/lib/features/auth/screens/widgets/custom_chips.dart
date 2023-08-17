import 'package:animate_do/animate_do.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/buttons/animated_button.dart';
import '../../../../core/common/containers/primary_container.dart';
import '../../data/categaory.dart';

class CustomChips extends StatelessWidget {
  final Category category;
  final int index;
  final VoidCallback onTap;
  final bool isSelected;
  const CustomChips({
    required this.isSelected,
    required this.category,
    required this.index,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return FadeIn(
      delay: const Duration(milliseconds: 200) * index,
      child: AnimatedButton(
        onTap: onTap,
        child: PrimaryContainer(
          color: isSelected
              ? AppColors.kPrimary
              : isDarkMode(context)
                  ? Colors.black
                  : AppColors.kWhite,
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 14.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(category.image),
              SizedBox(
                width: index == 0
                    ? 37.w
                    : index == 2
                        ? 20.w
                        : 27.w,
              ),
              Text(
                category.name,
                style: AppTypography.kBold16.copyWith(
                  color: isSelected
                      ? AppColors.kWhite
                      : isDarkMode(context)
                          ? Colors.white
                          : AppColors.kSecondary,
                ),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }
}
