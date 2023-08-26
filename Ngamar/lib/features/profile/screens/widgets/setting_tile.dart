import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';

class SettingTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  const SettingTile({
    required this.icon,
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(icon),
      minLeadingWidth: 10.w,
      title: Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Text(title, style: AppTypography.kSemiBold14),
      ),
    );
  }
}
