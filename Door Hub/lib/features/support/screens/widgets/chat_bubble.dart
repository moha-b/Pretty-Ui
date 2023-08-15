import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/date_time_format.dart';
import '../../data/chat_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatModel chat;
  const ChatBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return chat.isSender
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(AppAssets.kLogo),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Door Hub', style: AppTypography.kMedium15),
                        SizedBox(width: 6.w),
                        Text(
                            CustomDateTimeFormat.notificationDateFormat(
                                chat.messageTime),
                            style: AppTypography.kLight13
                                .copyWith(color: AppColors.kHint)),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                          color: isDarkMode(context)
                              ? AppColors.kDarkSurfaceColor
                              : AppColors.kInput,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          )),
                      child: Text(
                        chat.message,
                        style: AppTypography.kLight15,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            CustomDateTimeFormat.notificationDateFormat(
                                chat.messageTime),
                            style: AppTypography.kLight13
                                .copyWith(color: AppColors.kHint)),
                        SizedBox(width: 6.w),
                        Text('You', style: AppTypography.kMedium15),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                          color: AppColors.kPrimary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            topLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          )),
                      child: Text(
                        chat.message,
                        style: AppTypography.kLight15
                            .copyWith(color: AppColors.kWhite),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              CircleAvatar(
                backgroundImage: AssetImage(AppAssets.kProfilePic),
              ),
              SizedBox(width: 10.w),
            ],
          );
  }
}
