import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/common/common.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../../chat_call/screens/courier_call_view.dart';
import '../../chat_call/screens/courier_chat_view.dart';
import '../../home/screens/widgets/profile_image_card.dart';

class CompletedOrderView extends StatelessWidget {
  const CompletedOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            image: DecorationImage(
                image: AssetImage(AppAssets.kMap), fit: BoxFit.fill)),
        child: Container(
          padding: EdgeInsets.all(20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              color: AppColors.kLightPink2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomDivider(),
              SizedBox(height: 10.h),
              Text('Thank You Order!', style: AppTypography.kBold18),
              Text('#342347',
                  style: AppTypography.kMedium15
                      .copyWith(color: AppColors.kPrimary)),
              SizedBox(height: 20.h),
              const ProfileImageCard(),
              Text('Tony Nguyen', style: AppTypography.kMedium14),
              Text('004 Riley Street, 2050 Sydney',
                  style: AppTypography.kLight13),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.kCreditLogo, height: 20.h),
                          SizedBox(width: 5.w),
                          Text('•••• 2678', style: AppTypography.kLight13),
                        ],
                      ),
                      Text(
                        r'$ 35.00',
                        style: AppTypography.kExtraLight14
                            .copyWith(color: AppColors.kPrimary),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.kDistance, height: 20.h),
                          SizedBox(width: 5.w),
                          Text('Distance', style: AppTypography.kLight13),
                        ],
                      ),
                      Text(
                        '2.5 km',
                        style: AppTypography.kExtraLight14
                            .copyWith(color: AppColors.kPrimary),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.kTime, height: 20.h),
                          SizedBox(width: 5.w),
                          Text('Delivery', style: AppTypography.kLight13),
                        ],
                      ),
                      Text(
                        '15 : 38 min',
                        style: AppTypography.kExtraLight14
                            .copyWith(color: AppColors.kPrimary),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  const ProfileImageCard(),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Courier', style: AppTypography.kLight13),
                      Row(
                        children: [
                          Text('David Jame', style: AppTypography.kBold14),
                          SizedBox(width: 5.w),
                          Image.asset(AppAssets.kStarFilled, height: 20.h),
                          Text(
                            '5.0',
                            style: AppTypography.kLight11,
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomIconButton(
                      onTap: () {
                        Get.to(() => const CourierChatView());
                      },
                      icon: AppAssets.kChat),
                  SizedBox(width: 10.w),
                  CustomIconButton(
                      onTap: () {
                        Get.to(() => const CourierCallView());
                      },
                      icon: AppAssets.kCall),
                ],
              ),
              SizedBox(height: 15.h),
              PrimaryButton(
                onTap: () {},
                height: 50.h,
                borderRadius: 10.r,
                text: 'Completed',
              )
            ],
          ),
        ),
      ),
    );
  }
}
