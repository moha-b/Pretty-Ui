import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_typography.dart';
import '../buttons/primary_button.dart';

class ListEmptyCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const ListEmptyCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon),
        SizedBox(height: 31.h),
        Text(title, style: AppTypography.kBold20),
        Text(
          subtitle,
          style: AppTypography.kLight14,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        PrimaryButton(onTap: () {}, text: 'View All Services', width: 166.w),
      ],
    );
  }
}
