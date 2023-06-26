import 'package:chef/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.func,
    required this.icon,
    this.backgroundColor,
    this.padding,
  });
  final VoidCallback? func;
  final String icon;
  final Color? backgroundColor;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        padding: EdgeInsets.all(padding ?? 6),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.5),
            color: backgroundColor ?? AppColors.background),
        child: SvgPicture.asset(icon, color: Colors.black, fit: BoxFit.contain),
      ),
    );
  }
}
