import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class LastSearchCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const LastSearchCard({required this.onTap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.kLine,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTypography.kMedium14.copyWith(
                color: AppColors.kGrey60,
              ),
            ),
            SizedBox(width: AppSpacing.fiveHorizontal),
            const Icon(
              Icons.close,
              color: AppColors.kGrey60,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
