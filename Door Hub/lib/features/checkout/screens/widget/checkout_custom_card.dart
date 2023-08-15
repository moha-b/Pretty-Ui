import 'package:door_hub/core/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class CheckoutCustomCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CheckoutCustomCard(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PrimaryContainer(
        child: Row(
          children: [
            CustomHeaderText(text: text, fontSize: 18.sp),
            const Spacer(),
            IgnorePointer(
              ignoring: true,
              child: CustomButton(
                onTap: () {},
                icon: AppAssets.kAddRounded,
                text: 'Add',
                isBorder: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
