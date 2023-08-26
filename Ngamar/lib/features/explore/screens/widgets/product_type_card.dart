import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class ProductTypeCard extends StatelessWidget {
  final String type;
  final bool isSelected;
  final VoidCallback onTap;
  const ProductTypeCard({
    required this.isSelected,
    required this.onTap,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimary : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.kPrimary : AppColors.kLine,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          type,
          style: AppTypography.kSemiBold12.copyWith(
            color: isSelected ? AppColors.kWhite : AppColors.kGrey40,
          ),
        ),
      ),
    );
  }
}
