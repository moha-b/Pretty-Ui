import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listenlit/core/utils/utils.dart';

class TopLevelAppBar extends StatelessWidget {
  const TopLevelAppBar({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Good Afternoon',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kWhiteColor,
                  fontFamily: 'Inter',
                ),
              ),
              SvgPicture.asset(AppIcons.kUnderLineIcon)
            ]),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 48.r,
                backgroundImage: AssetImage(AppImagePath.kProfile),
              ),
            ),
          )
        ],
      ),
    );
  }
}
