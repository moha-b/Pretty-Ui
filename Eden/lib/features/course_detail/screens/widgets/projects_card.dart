import 'package:eden/core/common/containers/primary_container.dart';
import 'package:eden/features/profile/screens/widgets/profile_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/utils.dart';

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Row(
              children: [
                ProfileImageCard(
                  size: 50.h,
                  image: AppAssets.kUser5,
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('HaTin-Yu Chin', style: AppTypography.kBold16),
                    Text('4d ago', style: AppTypography.kLight14),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppAssets.kMoreVert,
                  color: AppColors.kSecondary,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              'Comments are appreciated',
              style: AppTypography.kLight14,
            ),
          ),
          SizedBox(height: 10.h),
          Image.asset(
            AppAssets.kProject,
            fit: BoxFit.cover,
            height: 200.h,
            width: double.maxFinite,
          ),
          Padding(
            padding: EdgeInsets.all(12..h),
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.kThumbUp),
                SizedBox(width: 5.w),
                Text('7k', style: AppTypography.kBold14),
                SizedBox(width: 10.w),
                SvgPicture.asset(AppAssets.kComment),
                SizedBox(width: 5..w),
                Text('89', style: AppTypography.kBold14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
