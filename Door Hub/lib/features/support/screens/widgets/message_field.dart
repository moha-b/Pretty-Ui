import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageField extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback attachmentCallback;
  final VoidCallback emojiCallback;
  final VoidCallback sendCallback;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const MessageField({
    super.key,
    required this.isExpanded,
    required this.attachmentCallback,
    required this.emojiCallback,
    required this.sendCallback,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Row(children: [
      isExpanded
          ? const SizedBox()
          : IconButton(
              onPressed: attachmentCallback,
              icon: SvgPicture.asset(AppAssets.kAttachment),
            ),
      isExpanded
          ? const SizedBox()
          : IconButton(
              onPressed: emojiCallback,
              icon: SvgPicture.asset(AppAssets.kEmoji),
            ),
      Expanded(
          child: AnimatedContainer(
        duration: const Duration(seconds: 550),
        curve: Curves.ease,
        decoration: BoxDecoration(
          color:
              isDarkMode(context) ? AppColors.kContentColor : AppColors.kInput,
          borderRadius: BorderRadius.circular(AppSpacing.radiusForty),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Type your massage',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  hintStyle: AppTypography.kLight13,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            ButtonAnimation(
              onTap: sendCallback,
              child: Container(
                  padding: EdgeInsets.all(9.h),
                  margin: EdgeInsets.only(right: 12.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kPrimary,
                  ),
                  child: SvgPicture.asset(AppAssets.kSend)),
            ),
          ],
        ),
      ))
    ]);
  }
}
