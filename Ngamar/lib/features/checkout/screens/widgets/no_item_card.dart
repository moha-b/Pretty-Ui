import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';

class NoItemCard extends StatelessWidget {
  const NoItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.h),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kGreenLight,
          ),
          child: SvgPicture.asset(
            AppAssets.kEmptyBox,
            height: 125.h,
            width: 125.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10.h),
        Center(
          child: Text(
            'Sorry! No items are here yet.',
            style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey60),
          ),
        ),
      ],
    );
  }
}
