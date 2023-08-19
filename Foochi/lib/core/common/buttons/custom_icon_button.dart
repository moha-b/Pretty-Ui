import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final Color? iconColor;
  final Color? borderCol;
  final double? size;
  const CustomIconButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.iconColor,
      this.borderCol,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size ?? 45.h,
        width: size ?? 45.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: iconColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: borderCol ?? const Color(0xFFD3BBAA)),
        ),
        child: SvgPicture.asset(
          icon,
          color: iconColor != null ? AppColors.kWhite : AppColors.kSecondary,
        ),
      ),
    );
  }
}
