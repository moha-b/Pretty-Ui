import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: currentIndex,
        iconSize: 30,
        selectedItemColor: AppColors.primary,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: AppStrings.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.book),
            label: AppStrings.booking,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_2user),
            label: AppStrings.profile,
          ),
        ]);
  }
}
