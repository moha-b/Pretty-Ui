import 'package:animations/animations.dart';
import 'package:door_hub/features/categories/screens/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../../home/data/services_model.dart';
import '../services_detail_screen.dart';

class SubCategoryListCard extends StatelessWidget {
  final ServicesModel service;
  const SubCategoryListCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (BuildContext _, VoidCallback openContainer) {
        return ServicesDetailView(services: service);
      },
      middleColor:
          isDarkMode(context) ? AppColors.kDarkSurfaceColor : AppColors.kWhite,
      openColor:
          isDarkMode(context) ? AppColors.kDarkSurfaceColor : AppColors.kWhite,
      closedColor:
          isDarkMode(context) ? AppColors.kDarkSurfaceColor : AppColors.kWhite,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return InkWell(
          onTap: openContainer,
          child: Row(
            children: [
              Container(
                height: 116.h,
                width: 105.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: AssetImage(service.image), fit: BoxFit.cover)),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingWidget(
                          service: service,
                        ),
                        const Spacer(),
                        const Icon(Icons.more_horiz)
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(service.name, style: AppTypography.kMedium14),
                    SizedBox(height: 4.h),
                    Text('Starts From',
                        style: AppTypography.kLight12.copyWith(
                            color: AppColors.kNeutral04.withOpacity(0.75))),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 4.5.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          color: AppColors.kLime,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Text('\$ ${service.price.toInt()}',
                          style: AppTypography.kMedium12),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
