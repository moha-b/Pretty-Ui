import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class SwitchTile extends StatefulWidget {
  final String title;
  final Function(bool value) onChanged;
  const SwitchTile({required this.title, required this.onChanged, super.key});

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(
        widget.title,
        style: AppTypography.kSemiBold16,
      ),
      trailing: SizedBox(
        height: 24.h,
        width: 48.w,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: CupertinoSwitch(
            value: switchValue,
            thumbColor: AppColors.kPrimary,
            trackColor: AppColors.kGrey20,
            activeColor: AppColors.kGrey20,
            onChanged: (value) {
              setState(() {
                switchValue = value;
                widget.onChanged(value);
              });
            },
          ),
        ),
      ),
    );
  }
}
