import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../../core/common/buttons/custom_icon_button.dart';

class ChangeImageCard extends StatelessWidget {
  final VoidCallback onTap;
  final File? pickedImage;
  const ChangeImageCard({Key? key, required this.onTap, this.pickedImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 130.h,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 130.h,
              width: 130.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kLightPink,
                  image: DecorationImage(
                      image: pickedImage == null
                          ? AssetImage(AppAssets.kProfilePic)
                          : FileImage(pickedImage!) as ImageProvider,
                      fit: BoxFit.cover)),
            ),
            CustomIconButton(
              onTap: onTap,
              size: 36.h,
              icon: AppAssets.kCamera,
              iconColor: AppColors.kPrimary,
              borderCol: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
