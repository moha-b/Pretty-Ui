import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/message/screens/widgets/chat_bubble.dart';
import 'package:eden/features/message/screens/widgets/message_appbar.dart';
import 'package:eden/features/message/screens/widgets/message_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../profile/screens/widgets/profile_image_card.dart';
import '../data/chat_message_model.dart';
import '../data/chat_model.dart';

class ConversationView extends StatelessWidget {
  final ChatModel chat;
  const ConversationView({required this.chat, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      appBar: const MessageAppBar(),
      body: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusThirty),
          ),
          color: isDarkMode(context) ? Colors.black : Colors.white,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
            color: AppColors.kPrimary.withOpacity(0.4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(AppSpacing.twentyVertical),
                child: Row(
                  children: [
                    Hero(
                      tag: chat.imageURL + chat.time,
                      child: ProfileImageCard(
                        image: chat.imageURL,
                        size: 60.h,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(chat.name, style: AppTypography.kBold16),
                        SizedBox(height: 6.h),
                        Text('Active Now', style: AppTypography.kLight14),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(AppAssets.kMoreVert, color: Colors.black),
                  ],
                ),
              ),
              Expanded(
                child: ColoredBox(
                  color: isDarkMode(context) ? Colors.black : Colors.white,
                  child: ListView.separated(
                    padding: EdgeInsets.all(AppSpacing.twentyVertical),
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        chat: messages[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemCount: messages.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const MessageField(),
    );
  }
}
