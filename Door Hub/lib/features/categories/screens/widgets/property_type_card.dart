import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../data/property_type.dart';

class PropertyTypeCard extends StatelessWidget {
  final PropertyType property;
  final VoidCallback onTap;
  final bool isSelected;
  const PropertyTypeCard(
      {super.key,
      required this.property,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 65.h,
            width: 65.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: isSelected ? AppColors.kPrimary : null,
                border: isSelected ? null : Border.all(color: AppColors.kHint)),
            child: SvgPicture.asset(
              property.image,
              colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.kWhite : AppColors.kHint,
                  BlendMode.srcIn),
            ),
          ),
          SizedBox(height: 10.h),
          Text(property.name, style: AppTypography.kLight13)
        ],
      ),
    );
  }
}
