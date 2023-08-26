import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/tracking/screens/widgets/custom_tracking_column.dart';

import '../../search/screens/widgets/filter_sheet.dart';

class TrackingDetail extends StatelessWidget {
  const TrackingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tracking Detail',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.kFullMap),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomDivider(),
                SizedBox(height: AppSpacing.twentyVertical),
                Container(
                  padding: EdgeInsets.all(24.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppColors.kLine),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.kTruckDelivery),
                      SizedBox(width: AppSpacing.twentyHorizontal),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#19984442MPX',
                            style:
                                AppTypography.kBold18.copyWith(fontSize: 14.sp),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'On Progress',
                            style: AppTypography.kSemiBold12
                                .copyWith(color: AppColors.kBlue),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset(AppAssets.kWorld),
                      ),
                      SizedBox(width: AppSpacing.fifteenHorizontal),
                      IconButton(
                        onPressed: () {},
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset(AppAssets.kPhone),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTrackingColumn(
                        heading: 'Estimate delivery',
                        info: 'July 29, 2022',
                      ),
                    ),
                    Expanded(
                      child: CustomTrackingColumn(
                        heading: 'Status',
                        info: 'On Progress',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.thirtyVertical),
                const Row(
                  children: [
                    Expanded(
                      child: CustomTrackingColumn(
                        heading: 'From',
                        info: 'St. Petersburg',
                      ),
                    ),
                    Expanded(
                      child: CustomTrackingColumn(
                        heading: 'To',
                        info: 'San Francisco',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Jackson Street, San Francisco, California 94109',
                        style: AppTypography.kLight10.copyWith(
                          color: AppColors.kGrey50,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        'Jackson Street, San Francisco, California 94109',
                        style: AppTypography.kLight10.copyWith(
                          color: AppColors.kGrey50,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.fiftyVertical),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
