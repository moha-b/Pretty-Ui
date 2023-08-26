import 'package:flutter/material.dart';
import 'package:ngamar/core/core.dart';

class TextWithDivider extends StatelessWidget {
  const TextWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.kGrey60,
          ),
        ),
        SizedBox(
          width: AppSpacing.twentyHorizontal,
        ),
        Text(
          'Or Sign In with',
          style: AppTypography.kMedium14.copyWith(
            color: AppColors.kGrey60,
          ),
        ),
        SizedBox(
          width: AppSpacing.twentyHorizontal,
        ),
        const Expanded(
          child: Divider(
            color: AppColors.kGrey60,
          ),
        ),
      ],
    );
  }
}
