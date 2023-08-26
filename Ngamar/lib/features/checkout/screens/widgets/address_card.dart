import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';


class AddressCard extends StatelessWidget {
  final bool isDetailView;
  const AddressCard({this.isDetailView = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusTwenty),
        border: Border.all(color: AppColors.kLine),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kLine,
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: AppColors.kGrey100,
            ),
          ),
          SizedBox(width: AppSpacing.tenHorizontal),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jhone Arent', style: AppTypography.kSemiBold14),
                SizedBox(height: AppSpacing.tenVertical),
                Text(
                  '4517 Washington Ave. Manchester, Kentucky 39495',
                  style: AppTypography.kMedium14.copyWith(
                    color: AppColors.kGrey60,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: AppSpacing.tenVertical),
                Text(
                  '(406) 555-0120',
                  style: AppTypography.kMedium14,
                ),
              ],
            ),
          ),
          if (!isDetailView)
            IconButton(
              onPressed: () {
                Get.back<void>();
              },
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(AppAssets.kEditIcon),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
