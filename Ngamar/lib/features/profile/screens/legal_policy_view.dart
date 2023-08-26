import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class LegalPolicyView extends StatelessWidget {
  const LegalPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Legal and Policy',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: RawScrollbar(
        thumbColor: AppColors.kPrimary,
        thumbVisibility: true,
        radius: const Radius.circular(20),
        thickness: 5,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          children: [
            Text(
              'Terms',
              style: AppTypography.kSemiBold16,
            ),
            SizedBox(height: AppSpacing.tenVertical),
            Text(
              '$dummyTextDescription\n\n$dummyTextDescription',
              textAlign: TextAlign.justify,
              style: AppTypography.kMedium14
                  .copyWith(color: AppColors.kGrey80, fontSize: 14.sp),
            ),
            SizedBox(height: AppSpacing.tenVertical),
            Text(
              'Changes to the Service and/or Terms:',
              style: AppTypography.kSemiBold16,
            ),
            SizedBox(height: AppSpacing.tenVertical),
            Text(
              '$dummyTextDescription\n\n$dummyTextDescription\n\n$dummyTextDescription\n\n$dummyTextDescription',
              textAlign: TextAlign.justify,
              style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey80),
            ),
          ],
        ),
      ),
    );
  }
}
