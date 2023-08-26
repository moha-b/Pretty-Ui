import 'package:flutter/material.dart';
import 'package:ngamar/core/core.dart';

class LanguageTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  const LanguageTile({
    required this.isSelected,
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(
        text,
        style: AppTypography.kSemiBold16,
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: AppColors.kPrimary,
            )
          : null,
    );
  }
}
