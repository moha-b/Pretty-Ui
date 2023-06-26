import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/home/widgets/search_widget.dart';
import 'package:chef/features/home/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'list_of_chefs_widget.dart';
import 'list_of_meals_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimns.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cookie",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                IconButton.outlined(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.notification)),
              ],
            ),
            const SearchField(),
            const SectionWidget(title: "Best Chefs"),
            SizedBox(
              height: getScreenHeight(110),
              child: const ListOfChefs(),
            ),
            SizedBox(height: getScreenHeight(20)),
            const SectionWidget(title: "Just for you"),
            SizedBox(
              height: getScreenHeight(280),
              child: const ListOfMeals(),
            ),
          ],
        ),
      ),
    );
  }
}
