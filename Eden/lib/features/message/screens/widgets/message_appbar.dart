import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/buttons/custom_icon_button.dart';

class MessageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    final iconColor = AppColors.kPrimary.withOpacity(0.4);

    return AppBar(
      leading: Padding(
        padding: EdgeInsets.all(7.h),
        child: CustomIconButton(
          onTap: () {
            Get.back<void>();
          },
          color: isDarkMode(context) ? Colors.black : iconColor,
          icon: AppAssets.kArrowBackIos,
        ),
      ),
      centerTitle: true,
      title: const Text('Messages'),
      actions: [
        CustomIconButton(
          onTap: () {},
          icon: AppAssets.kAdd,
          color: isDarkMode(context) ? Colors.black : iconColor,
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
