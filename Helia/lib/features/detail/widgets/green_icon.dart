import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/colors.dart';

class GreenIcon extends StatelessWidget {
  const GreenIcon({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          fit: BoxFit.cover,
          color: AppColors.primary,
          height: size.height * 0.05,
        ),
        const SizedBox(height: 4),
        Text(text),
      ],
    );
  }
}
