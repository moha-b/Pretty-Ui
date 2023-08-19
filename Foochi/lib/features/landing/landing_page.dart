import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../discount/screens/discount_view.dart';
import '../favorite/controller/favorite_controller.dart';
import '../favorite/screens/favorite_view.dart';
import '../home/screens/home_view.dart';
import '../menu/screens/menu_view.dart';
import '../orders/screens/order_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  FavoriteController fc = Get.put(FavoriteController());
  List<Widget> pages = [
    HomeView(),
    const FavoriteView(),
    const MenuView(),
    const DiscountView(),
    const OrderView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 65.h,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.kHome),
              label: 'Home',
              activeIcon: SvgPicture.asset(AppAssets.kSelectedHome),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.kFavorite),
              label: 'Favorite',
              activeIcon: SvgPicture.asset(AppAssets.kSelectedFavorite),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.kMenu),
              label: 'Menu',
              activeIcon: SvgPicture.asset(AppAssets.kSelectedMenu),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.kDiscount),
              label: 'Discount',
              activeIcon: SvgPicture.asset(AppAssets.kSelectedDiscount),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.kCart),
              label: 'Cart',
              activeIcon: SvgPicture.asset(AppAssets.kSelectedCart),
            ),
          ],
        ),
      ),
    );
  }
}
