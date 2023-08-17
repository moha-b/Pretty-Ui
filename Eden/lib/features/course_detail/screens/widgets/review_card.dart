import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/containers/primary_container.dart';
import '../../../../core/utils/utils.dart';
import '../../../profile/screens/widgets/profile_image_card.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding: EdgeInsets.all(18.h),
      child: Column(
        children: [
          Row(
            children: [
              ProfileImageCard(
                size: 50.h,
                image: AppAssets.kUser3,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ya Chin-Ho', style: AppTypography.kBold16),
                  Text('1d ago', style: AppTypography.kLight14),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                AppAssets.kMoreVert,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Text(
            'I strongly recommend this course to anyone interested in web design. I am so pleased with the website I’ve created from this course. 😇',
            style: AppTypography.kLight14,
          ),
        ],
      ),
    );
  }
}
