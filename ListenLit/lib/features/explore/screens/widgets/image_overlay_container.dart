
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageOverlayContainer extends StatelessWidget {
  const ImageOverlayContainer({
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
      height: 321.82.h,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            backGroundImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
