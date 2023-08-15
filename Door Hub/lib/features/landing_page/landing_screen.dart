import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:showcaseview/showcaseview.dart';

import '../bookings/screens/bookings_screen.dart';
import '../home/screens/home_view_screen.dart';
import '../notifications/screens/notification_screen.dart';
import '../support/screens/support_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(drawerKey: scaffoldKey),
      const BookingsView(),
      const NotificationView(),
      const SupportView(),
    ];
    return ShowCaseWidget(
      builder: Builder(builder: (context) {
        return Scaffold(
          key: scaffoldKey,
          body: pages[_currentIndex],
          drawer: const CustomDrawer(),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: SvgPicture.asset(AppAssets.kHome),
                    activeIcon: SvgPicture.asset(AppAssets.kActiveHome)),
                BottomNavigationBarItem(
                    label: 'Orders',
                    icon: SvgPicture.asset(AppAssets.kOrder),
                    activeIcon: SvgPicture.asset(AppAssets.kActiveOrder)),
                BottomNavigationBarItem(
                  label: 'Notifications',
                  icon: SvgPicture.asset(
                    AppAssets.kNotification,
                    colorFilter: const ColorFilter.mode(
                        AppColors.kNeutral04, BlendMode.srcIn),
                  ),
                  activeIcon: SvgPicture.asset(
                    AppAssets.kNotification,
                    colorFilter: const ColorFilter.mode(
                        AppColors.kPrimary, BlendMode.srcIn),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Chat',
                  icon: SvgPicture.asset(AppAssets.kChatMenu),
                  activeIcon: SvgPicture.asset(
                    AppAssets.kChatMenu,
                    colorFilter: const ColorFilter.mode(
                        AppColors.kPrimary, BlendMode.srcIn),
                  ),
                ),
              ]),
        );
      }),
    );
  }
}
