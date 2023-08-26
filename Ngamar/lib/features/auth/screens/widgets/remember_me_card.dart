import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class RememberMeCard extends StatefulWidget {
  final Function(bool isChecked) onChanged;
  const RememberMeCard({required this.onChanged, super.key});

  @override
  State<RememberMeCard> createState() => _RememberMeCardState();
}

class _RememberMeCardState extends State<RememberMeCard> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
            widget.onChanged(_isChecked);
          },
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isChecked ? AppColors.kPrimary : AppColors.kGrey30,
                width: 2,
              ),
            ),
            child: _isChecked
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: AppColors.kPrimary,
                  )
                : null,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'Remember me',
          style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey70),
        ),
      ],
    );
  }
}
