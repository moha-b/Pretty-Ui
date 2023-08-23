import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTab, required this.subtitleTextStyle,
  });
  final String title, subtitle;
  final TextStyle   subtitleTextStyle;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter'),
          children: <TextSpan>[
            TextSpan(
              text: subtitle,
              style:subtitleTextStyle ,
            ),
          ],
        ),
      ),
    );
  }
}
