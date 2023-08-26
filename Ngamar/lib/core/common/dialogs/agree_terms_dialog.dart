import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/utils/utils.dart';

import '../buttons/custom_text_button.dart';
import '../buttons/primary_button.dart';

class AgreeTermsDialog extends StatelessWidget {
  final VoidCallback disagreeCallback;
  final VoidCallback agreeCallback;
  const AgreeTermsDialog({
    required this.agreeCallback,
    required this.disagreeCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'I agree to the Terms of Service and Conditions of Use including consent to electronic communications and I affirm that the information provided is my own.',
            style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey70),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  onPressed: disagreeCallback,
                  text: 'Disagree',
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  onTap: agreeCallback,
                  text: 'Agree',
                  fontSize: 14.sp,
                  width: 115.w,
                  height: 46.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
