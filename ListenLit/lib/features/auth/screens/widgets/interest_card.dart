import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class InterestCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  const InterestCard({
    required this.onTap,
    required this.text,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.only(left: 10.w, top: 10.h, right: 9.w, bottom: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.kPrimary : AppColor.kSamiDarkColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: 0.4,
            color: isSelected ? AppColor.kSamiDarkColor : AppColor.kGrey2Color,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? AppColor.kSamiDarkColor
                    : AppColor.kSamiAccentColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Icon(
                isSelected
                    ? Icons.check_circle_outline
                    : Icons.add_circle_outline_rounded,
                color: isSelected
                    ? AppColor.kSamiDarkColor
                    : AppColor.kSamiAccentColor,
                size: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
