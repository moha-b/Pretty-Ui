import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';

class StoryCardWidget extends StatelessWidget {
  UserModel userModel;

  StoryCardWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.kPrimary, width: 2.w),
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(userModel.userImage),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            userModel.userName,
            style: TextStyle(
              color: AppColor.kLightAccentColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
