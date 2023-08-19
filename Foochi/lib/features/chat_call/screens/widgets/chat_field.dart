import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../../core/common/buttons/custom_icon_button.dart';
import '../../../../core/services/image_picker.dart';

class ChatField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  const ChatField({super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: AppAssets.kCamera,
          onTap: () {
            ImagePickerServices().getImageFromCamera();
          },
          size: 40.h,
        ),
        SizedBox(width: 5.w),
        CustomIconButton(
          onTap: () {},
          size: 40.h,
          icon: AppAssets.kSpeaker,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Message...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        IconButton(
          onPressed: onSend,
          icon: SvgPicture.asset(AppAssets.kSend),
        )
      ],
    );
  }
}
