import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_theme.dart';
import '../buttons/custom_icon_button.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback leadingCallback;
  final Color? iconColor;
  final Widget? title;
  const CustomBackAppBar({
    required this.leadingCallback,
    this.iconColor,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 70.w,
      systemOverlayStyle: customOverlay,
      leading: Padding(
        padding: EdgeInsets.all(7.h),
        child: CustomIconButton(
          onTap: leadingCallback,
          icon: AppAssets.kArrowBackIos,
          color: iconColor,
        ),
      ),
      centerTitle: true,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
