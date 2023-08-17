import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/buttons/animated_button.dart';

class UserTypeCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  final String image;
  const UserTypeCard({
    required this.onTap,
    required this.isSelected,
    required this.text,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedButton(
        onTap: onTap,
        child: Container(
          width: 160.w,
          height: 270.h,
          padding: EdgeInsets.all(12.h),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: isSelected
                ? AppColors.kPrimary
                : isDarkMode(context)
                    ? Colors.black
                    : AppColors.kWhite,
            boxShadow: [AppColors.defaultShadow],
          ),
          child: Column(
            children: [
              Text(
                text,
                style: AppTypography.kBold16.copyWith(
                  color: isSelected
                      ? AppColors.kWhite
                      : isDarkMode(context)
                          ? Colors.white
                          : AppColors.kSecondary,
                ),
              ),
              const Spacer(),
              Image.asset(image),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
