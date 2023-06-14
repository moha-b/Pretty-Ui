import 'package:flutter/material.dart';
import 'package:helia/core/resources/themes.dart';

import 'features/splash/screens/splash_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

AppThemes appThemes = AppThemes();

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    appThemes.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: appThemes.themeMode,
      home: const SplashScreen1(),
    );
  }

  @override
  void dispose() {
    appThemes.removeListener(themeListener);
    super.dispose();
  }
}
