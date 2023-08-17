import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/custom_painter/curve_clipper.dart';
import '../../../profile/screens/widgets/profile_image_card.dart';
import '../../data/online_people_model.dart';

class OnlineCard extends StatelessWidget {
  final OnlinePeople online;
  const OnlineCard({required this.online, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65.0.h,
          width: 55.w,
          child: Stack(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: ProfileImageCard(
                  image: online.image,
                  size: 60.h,
                ),
              ),
              Positioned(
                bottom: 2,
                right: 0,
                child: Container(
                  height: 14.h,
                  width: 14.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kSuccess,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(online.name, style: AppTypography.kLight14),
      ],
    );
  }
}
