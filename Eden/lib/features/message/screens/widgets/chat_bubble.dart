import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/chat_message_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage chat;
  const ChatBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: chat.messageType == 'receiver'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: chat.messageType == 'receiver'
              ? (isDarkMode(context)
                  ? AppColors.kSecondary
                  : AppColors.kPrimary)
              : (isDarkMode(context)
                  ? AppColors.kWhite
                  : AppColors.kPrimary.withOpacity(0.08)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          chat.messageContent,
          style: AppTypography.kLight14.copyWith(
            color: chat.messageType == 'receiver'
                ? AppColors.kWhite
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
