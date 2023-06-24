import 'package:chef/core/resources/themes.dart';
import 'package:chef/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: const OnboardingScreen(),
    );
  }
}
