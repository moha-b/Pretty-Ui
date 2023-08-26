import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/profile/screens/widgets/switch_tile.dart';

class SecurityView extends StatefulWidget {
  const SecurityView({super.key});

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Security',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.kLine),
            ),
            child: Column(
              children: [
                SwitchTile(
                  title: 'Face ID',
                  onChanged: (value) {},
                ),
                Divider(color: AppColors.kLine, height: 1.0.h),
                SwitchTile(
                  title: 'Remember Password',
                  onChanged: (value) {},
                ),
                Divider(color: AppColors.kLine, height: 1.h),
                SwitchTile(
                  title: 'Touch ID',
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
