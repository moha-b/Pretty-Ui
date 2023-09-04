import 'package:flutter/material.dart';

class Scrollfunc {
  static final PageController pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  static void nextPage() async {
    await pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  static void prevPage() async {
    await Scrollfunc.pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}
