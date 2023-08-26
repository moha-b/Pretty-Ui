import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/utils/utils.dart';

import '../buttons/primary_button.dart';

class PasswordChangeSuccessDialog extends StatelessWidget {
  final VoidCallback continueCallback;
  const PasswordChangeSuccessDialog({
    required this.continueCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.kSuccessIcon,
            height: 100.h,
            width: 115.0.w,
            fit: BoxFit.cover,
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Text(
            'Success',
            style: AppTypography.kSemiBold18,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.fiveVertical),
          Text(
            'Your password is successfully created',
            style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey70),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          PrimaryButton(
            onTap: continueCallback,
            text: 'Continue',
            fontSize: 14.sp,
            width: 115.w,
            height: 46.h,
          ),
        ],
      ),
    );
  }
}
