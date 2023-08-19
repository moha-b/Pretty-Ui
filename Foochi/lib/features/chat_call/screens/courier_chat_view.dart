import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/chat_call/screens/widgets/chat_bubble.dart';
import 'package:foochi/features/chat_call/screens/widgets/chat_field.dart';

import '../../../core/common/divider/custom_divider.dart';
import '../../home/screens/widgets/profile_image_card.dart';
import '../../profile/data/user_model.dart';
import '../data/chat_model.dart';

class CourierChatView extends StatefulWidget {
  const CourierChatView({super.key});

  @override
  State<CourierChatView> createState() => _CourierChatViewState();
}

class _CourierChatViewState extends State<CourierChatView> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            color: AppColors.kLightPink2,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDivider(),
            SizedBox(height: 10.h),
            Center(child: Text('Chat', style: AppTypography.kBold24)),
            SizedBox(height: 20.h),
            Row(
              children: [
                const ProfileImageCard(),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('David Jame', style: AppTypography.kBold14),
                    Row(
                      children: [
                        Image.asset(AppAssets.kStarFilled, height: 20.h),
                        SizedBox(width: 3.w),
                        Text(
                          '5.0',
                          style: AppTypography.kLight11,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (ctx, i) {
                    return ChatBubble(
                      chat: dummyChatList[i],
                    );
                  },
                  separatorBuilder: (ctx, i) => SizedBox(height: 10.h),
                  itemCount: dummyChatList.length),
            ),
            SizedBox(height: 10.h),
            ChatField(
              controller: _messageController,
              onSend: () {
                dummyChatList.add(ChatModel(
                    id: '3883',
                    sender: courierUser,
                    receiver: currentUser,
                    message: _messageController.text.trim(),
                    isReceiver: true));
                setState(() {});
                _messageController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
