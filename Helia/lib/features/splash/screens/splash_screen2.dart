import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helia/core/resources/images.dart';
import 'package:helia/features/onboarding/screens/onboarding_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _nextPage);
  }

  _nextPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ));
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(AppImages.splash, fit: BoxFit.fitHeight)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
