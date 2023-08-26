import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/utils/utils.dart';

import '../buttons/custom_outlined_button.dart';
import '../buttons/primary_button.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback logoutCallback;
  const LogoutDialog({required this.logoutCallback, super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.kHelp),
            SizedBox(height: AppSpacing.twentyVertical),
            Text('Are You Sure?', style: AppTypography.kSemiBold16),
            SizedBox(height: AppSpacing.fiveVertical),
            Text(
              'Do you want to log out ?',
              style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey60),
            ),
            SizedBox(height: AppSpacing.twentyVertical),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onTap: logoutCallback,
                    width: 115.0.w,
                    borderRadius: 30.0.r,
                    height: 46.0.h,
                    fontSize: 14.0.sp,
                    text: 'Logout',
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    onTap: () {
                      Get.back<void>();
                    },
                    width: 115.w,
                    borderRadius: 30.r,
                    height: 46.h,
                    fontSize: 14.sp,
                    text: 'Cancel',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
