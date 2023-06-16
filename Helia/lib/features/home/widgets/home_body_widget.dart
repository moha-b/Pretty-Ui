import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:helia/features/home/widgets/categories.dart';
import 'package:helia/features/home/widgets/categroies_items_widget.dart';
import 'package:helia/features/home/widgets/section_title.dart';
import 'package:iconsax/iconsax.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeText,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 40),
            ),
            Container(
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
                  suffixIcon:
                      Icon(Iconsax.setting_44, color: AppColors.primary),
                  border: InputBorder.none,
                  hintText: AppStrings.search,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
              child: const Categories(),
            ),
            CategoriesItems(),
            SectionTitle(),
          ],
        ),
      ),
    );
  }
}
