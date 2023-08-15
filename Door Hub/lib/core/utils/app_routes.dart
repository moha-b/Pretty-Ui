import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/onboarding/screens/onboarding_screen.dart';

class AppRoutes {
  static String onboarding = '/';

  static List<GetPage> routes = [
    GetPage<Route<dynamic>>(
      name: onboarding,
      page: () => const OnboardingScreen(),
    ),
  ];

  static String getOnboardingRoute() => onboarding;
}
