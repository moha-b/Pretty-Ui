import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:helia/features/home/widgets/home_body_widget.dart';
import 'package:helia/features/search/screen/search_screen.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeBody(),
    const SearchScreen(),
    const HomeBody(),
    const HomeBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        ],
      ),
    );
  }
}

/*
* AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(AppDimns.small),
              padding: const EdgeInsets.all(AppDimns.small),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimns.medium),
                gradient: LinearGradient(
                  colors: [Colors.green.shade200, Colors.green.shade400],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Image.asset(AppImages.lightLogo),
            ),
            Text(
              AppStrings.application,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(AppImages.notification),
          SizedBox(width: AppDimns.medium),
          SvgPicture.asset(AppImages.bookmark),
          SizedBox(width: AppDimns.medium),
        ],
      ),
*/
