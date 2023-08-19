import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/profile/screens/widgets/notification_card.dart';

import '../../../core/common/buttons/custom_icon_button.dart';

class ProfileNotificationView extends StatelessWidget {
  const ProfileNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (ctx, i) {
          return Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.2,
                motion: const ScrollMotion(),
                children: [
                  SizedBox(width: 20.w),
                  CustomIconButton(
                    icon: AppAssets.kDelete,
                    onTap: () {},
                  ),
                ],
              ),
              child: const NotificationCard());
        },
        separatorBuilder: (ctx, i) => SizedBox(height: 20.h),
        itemCount: 10);
  }
}
