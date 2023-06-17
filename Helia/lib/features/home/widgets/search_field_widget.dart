import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:iconsax/iconsax.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimns.medium),
      padding: const EdgeInsets.all(AppDimns.small),
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(AppDimns.medium),
      ),
      child: const TextField(
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          prefixIcon: Icon(Iconsax.search_normal),
          suffixIcon: Icon(Iconsax.setting_44, color: AppColors.primary),
          border: InputBorder.none,
          hintText: AppStrings.search,
        ),
      ),
    );
  }
}
