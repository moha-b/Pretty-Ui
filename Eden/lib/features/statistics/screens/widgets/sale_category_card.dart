import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/containers/primary_container.dart';
import '../../../auth/data/categaory.dart';
import 'custom_progress_bar.dart';

class SaleCategoryCard extends StatelessWidget {
  final Category category;
  const SaleCategoryCard({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return PrimaryContainer(
      width: 135.w,
      height: 150.h,
      padding: EdgeInsets.all(12.h),
      child: Column(
        children: [
          const CustomProgressBar(
            progress: 0.5,
            text: '528',
          ),
          const Spacer(),
          Text(
            category.name,
            style: AppTypography.kLight16.copyWith(
              color:
                  isDarkMode(context) ? AppColors.kWhite : AppColors.kSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
