import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/common/buttons/buttons.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/orders/screens/widgets/rate_courier_sheet.dart';

class PreviousOrderCard extends StatelessWidget {
  final bool isHistoryView;
  final Color? color;
  const PreviousOrderCard({super.key, this.isHistoryView = false, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
              color: color == null ? AppColors.kLine2 : Colors.transparent)),
      child: Column(
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
              SvgPicture.asset(AppAssets.kDone),
              SizedBox(width: 10.w),
              Text(
                'Delivered',
                style:
                    AppTypography.kLight13.copyWith(color: AppColors.kPrimary),
              ),
              const Spacer(),
              Text(
                '#342347',
                style:
                    AppTypography.kLight13.copyWith(color: AppColors.kPrimary),
              ),
              const Spacer(),
              Text(
                '26 Jun, 11:15',
                style:
                    AppTypography.kLight13.copyWith(color: AppColors.kPrimary),
              ),
            ],
          ),
          !isHistoryView ? SizedBox(height: 20.h) : const SizedBox(),
          !isHistoryView
              ? Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                          height: 40.h,
                          borderRadius: 10.r,
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30.r))),
                                builder: (context) {
                                  return const RateCourierSheet();
                                });
                          },
                          text: 'Rate Courier'),
                    ),
                    Expanded(
                      child: PrimaryButton(
                        onTap: () {},
                        height: 40.h,
                        borderRadius: 10.r,
                        text: 'Re Order',
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
