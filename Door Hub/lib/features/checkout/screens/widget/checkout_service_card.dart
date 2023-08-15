import 'package:door_hub/core/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/utils.dart';

class CheckoutServiceCard extends StatelessWidget {
  const CheckoutServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        child: Column(
      children: [
        Row(
          children: [
            CustomHeaderText(
              text: 'Service',
              fontSize: 18.sp,
            ),
            const Spacer(),
            const Icon(Icons.more_horiz),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Container(
              height: 55.h,
              width: 55.w,
              padding: EdgeInsets.all(17.h),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kAccent1),
              child: SvgPicture.asset(AppAssets.kAcRepair),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AC Installation (Both Unit)',
                    style: AppTypography.kMedium16),
                SizedBox(height: 5.h),
                Text(
                  '1 Ton-1.5 Ton x2',
                  style: AppTypography.kLight14
                      .copyWith(color: AppColors.kNeutral),
                ),
              ],
            ),
          ],
        )
      ],
    ));
  }
}
