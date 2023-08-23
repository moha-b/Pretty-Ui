import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class BookDescriptionColumn extends StatelessWidget {
  const BookDescriptionColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this Book',
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            color: AppColor.kWhiteColor,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'Getting Along (2022) describes the importance of workplace interactions and their effect on productivity and creativity.',
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Gotham',
              color: AppColor.kLightWhite),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        )
      ],
    );
  }
}
