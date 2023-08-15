import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey showCaseKey;
  final VoidCallback onLeadingPressed;

  const HomeAppBar({
    super.key,
    required this.showCaseKey,
    required this.onLeadingPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      leading: IconButton(
        onPressed: onLeadingPressed,
        icon: SvgPicture.asset(
          AppAssets.kMenu,
          colorFilter: ColorFilter.mode(
              isDarkMode(context) ? AppColors.kWhite : Colors.black,
              BlendMode.srcIn),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Location',
            style: AppTypography.kLight9.copyWith(color: AppColors.kGrey),
          ),
          Text(
            '21, Baker Street',
            style: AppTypography.kExtraLight13.copyWith(
                color: isDarkMode(context) ? AppColors.kWhite : Colors.black),
          ),
        ],
      ),
    );
  }
}
