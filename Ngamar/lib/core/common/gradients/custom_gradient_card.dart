import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientCard extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  const CustomGradientCard({
    required this.child,
    required this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28.h),
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: child,
    );
  }
}
