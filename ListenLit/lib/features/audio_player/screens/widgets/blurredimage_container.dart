import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurredImageContainer extends StatelessWidget {
  const BlurredImageContainer({
    super.key,
    required this.backGroundImage,
    required this.forGroundImage,
  });

  final String backGroundImage;
  final String forGroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 395.82.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            backGroundImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: 170.w,
          height: 220.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(forGroundImage),
            ),
          ),
        ),
      ),
    );
  }
}