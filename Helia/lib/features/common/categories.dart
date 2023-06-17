import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/strings.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int current = 0;

    return StatefulBuilder(
      builder: (
        BuildContext context,
        void Function(void Function()) setState,
      ) =>
          ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(AppDimns.small),
        itemCount: AppStrings.categories.length,
        itemBuilder: (
          context,
          index,
        ) =>
            InkWell(
          onTap: () {
            setState(() {
              current = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: AppDimns.small),
            decoration: BoxDecoration(
              color: current == index ? AppColors.primary : Colors.white,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(AppDimns.medium),
            ),
            child: Text(
              AppStrings.categories[index],
              style: TextStyle(
                color: current == index ? Colors.white : AppColors.primary,
                fontSize: 17,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppDimns.medium),
      ),
    );
  }
}
