import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

import '../../data/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notifications;
  const NotificationCard({required this.notifications, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: AssetImage(
                notifications.notificationType == NotificationType.update
                    ? AppAssets.kNotDiscount
                    : AppAssets.kNotReceipt,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            notifications.title,
            style: AppTypography.kSemiBold14,
          ),
          const Spacer(),
          Text(
            notifications.notificationDateTime,
            style: AppTypography.kSemiBold14,
          ),
        ],
      ),
      subtitle: Text(
        notifications.notificationMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: AppTypography.kMedium14,
      ),
    );
  }
}
