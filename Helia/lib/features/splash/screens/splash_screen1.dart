import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helia/core/resources/images.dart';
import 'package:helia/features/splash/screens/splash_screen2.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _nextPage);
  }

  _nextPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen2(),
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
        padding: const EdgeInsets.all(150),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.green.shade900],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Image.asset(
          AppImages.lightLogo,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
