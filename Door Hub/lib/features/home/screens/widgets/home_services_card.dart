import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../../categories/screens/services_detail_screen.dart';
import '../../data/services_model.dart';

class HomeServicesCard extends StatelessWidget {
  final ServicesModel service;
  const HomeServicesCard({required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (BuildContext _, VoidCallback openContainer) {
          return ServicesDetailView(services: service);
        },
        middleColor: isDarkMode(context)
            ? AppColors.kDarkSurfaceColor
            : AppColors.kWhite,
        openColor: isDarkMode(context)
            ? AppColors.kDarkSurfaceColor
            : AppColors.kWhite,
        closedColor: isDarkMode(context)
            ? AppColors.kDarkSurfaceColor
            : AppColors.kWhite,
        closedShape: const RoundedRectangleBorder(),
        closedElevation: 0.0,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return InkWell(
            onTap: openContainer,
            child: Column(
              children: [
                Container(
                  width: 139.w,
                  height: 164.h,
                  padding: EdgeInsets.all(9.h),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          image: AssetImage(service.image), fit: BoxFit.cover)),
                  child: service.discount != null
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 3.h),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Text(
                            service.discount!,
                            style: AppTypography.kMedium12
                                .copyWith(color: AppColors.kWhite),
                          ),
                        )
                      : null,
                ),
                const Spacer(),
                Text(service.name, style: AppTypography.kMedium14),
              ],
            ),
          );
        });
  }
}
