import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimns.small, vertical: AppDimns.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Text(
            "See All",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
