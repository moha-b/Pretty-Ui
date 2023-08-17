import 'package:animate_do/animate_do.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupCompleteView extends StatelessWidget {
  const SetupCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 120.h),
          FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              'You’re all set, Emmy!',
              style: AppTypography.kBold32,
            ),
          ),
          SizedBox(height: AppSpacing.tenVertical),
          FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              'Thank you for taking the time to\nget started on Learn Eden.',
              textAlign: TextAlign.center,
              style: AppTypography.kLight16,
            ),
          ),
          Image.asset(AppAssets.kStoreSet),
          const Spacer(),
        ],
      ),
    );
  }
}
