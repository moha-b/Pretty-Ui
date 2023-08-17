import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class ProfileImageCard extends StatelessWidget {
  final double? size;
  final String? image;
  const ProfileImageCard({this.image, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 90.h,
      width: size ?? 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: image == null
              ? AssetImage(AppAssets.kTeacher1)
              : AssetImage(image!) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
