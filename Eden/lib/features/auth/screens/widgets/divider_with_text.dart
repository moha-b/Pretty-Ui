import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          SizedBox(width: AppSpacing.fifteenHorizontal),
          Text(
            'or',
            style: AppTypography.kLight16,
          ),
          SizedBox(width: AppSpacing.fifteenHorizontal),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
