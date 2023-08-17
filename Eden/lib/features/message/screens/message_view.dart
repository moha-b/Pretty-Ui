import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/message/screens/widgets/chat_card.dart';
import 'package:eden/features/message/screens/widgets/message_appbar.dart';
import 'package:eden/features/message/screens/widgets/online_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/widgets/search_field.dart';
import '../data/chat_model.dart';
import '../data/online_people_model.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const MessageAppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusThirty),
          ),
          color: isDarkMode(context) ? Colors.black : Colors.white,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSpacing.radiusThirty),
            ),
            color: AppColors.kPrimary.withOpacity(0.4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSpacing.radiusThirty),
            ),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.h),
                      child: SearchField(
                        controller: _searchController,
                        isEnabled: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20..h),
                      child:
                          Text('10 are online', style: AppTypography.kBold18),
                    ),
                    SizedBox(
                      height: 90.h,
                      child: ListView.separated(
                        padding:
                            EdgeInsets.only(left: AppSpacing.twentyHorizontal),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return OnlineCard(
                            online: onlinePeople[index],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 15.w),
                        itemCount: onlinePeople.length,
                      ),
                    ),
                    SizedBox(
                      height: AppSpacing.thirtyVertical,
                    ),
                    ColoredBox(
                      color: isDarkMode(context) ? Colors.black : Colors.white,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: 8,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(AppSpacing.twentyHorizontal),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 30.h),
                        itemBuilder: (content, index) {
                          return ChatCard(
                            chat: chatList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
