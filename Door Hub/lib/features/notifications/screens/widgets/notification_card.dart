import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/helper/date_time_format.dart';
import '../../data/notification_model.dart';

class NotificationCard extends StatefulWidget {
  final NotificationModel notification;
  final int index;
  const NotificationCard(
      {required this.notification, required this.index, super.key});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (widget.index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : Get.width, 0, 0),
      child: Row(
        children: [
          Container(
            height: 55.h,
            width: 55.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.notification.type == NotificationType.orderPaid
                  ? AppColors.kAccent1
                  : widget.notification.type == NotificationType.orderBooked
                      ? AppColors.kAccent2
                      : widget.notification.type == NotificationType.orderDone
                          ? AppColors.kAccent4
                          : widget.notification.type ==
                                  NotificationType.orderTime
                              ? AppColors.kWarning
                              : AppColors.kAccent7,
            ),
            child: SvgPicture.asset(widget.notification.type ==
                    NotificationType.orderPaid
                ? AppAssets.kPaid
                : widget.notification.type == NotificationType.orderBooked
                    ? AppAssets.kBooked
                    : widget.notification.type == NotificationType.orderDone
                        ? AppAssets.kOrderDone
                        : widget.notification.type == NotificationType.orderTime
                            ? AppAssets.kBookedService
                            : AppAssets.kOrderCancel),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: widget.notification.notificationAbout,
                      style: AppTypography.kMedium16.copyWith(
                          color: isDarkMode(context)
                              ? AppColors.kWhite
                              : Colors.black),
                      children: [
                        TextSpan(
                            text: widget.notification.notificationMessage,
                            style: AppTypography.kMedium16
                                .copyWith(color: const Color(0xFF9A9FA5))),
                        TextSpan(
                            text: widget.notification.notificationInfo,
                            style: AppTypography.kMedium16)
                      ]),
                ),
                SizedBox(height: 5.h),
                Text(
                  CustomDateTimeFormat.notificationDateFormat(
                      widget.notification.notificationTime),
                  style: AppTypography.kLight14
                      .copyWith(color: AppColors.kNeutral),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
