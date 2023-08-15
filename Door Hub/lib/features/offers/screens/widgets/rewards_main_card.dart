import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RewardsMainCard extends StatelessWidget {
  const RewardsMainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        children: [
          Container(
            height: 170.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.kPrimary,
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                    image: AssetImage(AppAssets.kRewards), fit: BoxFit.cover)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                AppAssets.kBronzeBadge,
                height: 45.h,
                colorFilter:
                    const ColorFilter.mode(AppColors.kWhite, BlendMode.srcIn),
              ),
              Text(
                '2,400',
                style: AppTypography.kBold32.copyWith(color: AppColors.kWhite),
              ),
              Text(
                'Current Points',
                style: AppTypography.kLight12.copyWith(color: AppColors.kWhite),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
