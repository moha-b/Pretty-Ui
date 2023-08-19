import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../../core/common/buttons/custom_icon_button.dart';

class RefundOrderCard extends StatelessWidget {
  const RefundOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const ScrollMotion(),
          children: [
            SizedBox(width: 20.w),
            CustomIconButton(
              icon: AppAssets.kStar,
              onTap: () {},
            ),
            SizedBox(width: 5.w),
            CustomIconButton(
              icon: AppAssets.kDelete,
              borderCol: Colors.transparent,
              iconColor: AppColors.kPrimary,
              onTap: () {},
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20.h),
          decoration: BoxDecoration(
              color: AppColors.kLightPink,
              borderRadius: BorderRadius.circular(30.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.kFoodImage1,
                    height: 50.h,
                    width: 50.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Fried, Mixed Potatoes',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.kExtraLight15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              r'$38.69',
                              style: AppTypography.kLight16
                                  .copyWith(color: AppColors.kLightBrown),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              ' •  2 Dishes',
                              style: AppTypography.kLight11,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.kRefund),
                  SizedBox(width: 10.w),
                  Text(
                    'Refund',
                    style: AppTypography.kLight13
                        .copyWith(color: AppColors.kOrange),
                  ),
                  const Spacer(),
                  Text(
                    '#342347',
                    style: AppTypography.kLight13
                        .copyWith(color: AppColors.kOrange),
                  ),
                  const Spacer(),
                  Text(
                    '26 Jun, 11:15',
                    style: AppTypography.kLight13
                        .copyWith(color: AppColors.kOrange),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text('REFUND REASON', style: AppTypography.kLight11),
              Text('Delayed delivery, not on time',
                  style: AppTypography.kLight13),
            ],
          ),
        ));
  }
}
