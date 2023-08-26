import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class ColorCard extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final bool isSelected;
  const ColorCard({
    required this.color,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                size: 16,
                color: color == Colors.black
                    ? AppColors.kWhite
                    : AppColors.kGrey100,
              )
            : null,
      ),
    );
  }
}
