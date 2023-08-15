import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/app_typography.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? padding;
  const AuthField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.onChanged,
      this.padding,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: AppTypography.kMedium14,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(hintText: hintText, contentPadding: padding),
      keyboardType: keyboardType,
    );
  }
}
