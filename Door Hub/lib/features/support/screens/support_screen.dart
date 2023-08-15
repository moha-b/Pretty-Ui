import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:door_hub/features/support/screens/widgets/support_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'live_chat_screen.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const CustomHeaderText(text: 'Support'),
            SizedBox(height: 20.h),
            SupportCard(
                onTap: () {
                  Get.to(() => const LiveChatView());
                },
                image: AppAssets.kLiveChat,
                title: 'Live Chat',
                subtitle: 'Chat time 9am- 9pm'),
            SizedBox(height: 16.h),
            SupportCard(
                image: AppAssets.kPhoneCall,
                title: 'Phone Call',
                subtitle: 'Calling hour 9am- 9pm'),
            SizedBox(height: 16.h),
            SupportCard(
                image: AppAssets.kWhatsappCall,
                title: 'WhatsApp Call',
                subtitle: 'Calling hour 9am- 9pm'),
          ],
        ),
      ),
    );
  }
}
