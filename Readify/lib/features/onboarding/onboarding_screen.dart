import 'package:flutter/material.dart';
import 'package:readify/core/resources/dimn.dart';
import 'package:readify/core/resources/images.dart';
import 'package:readify/core/resources/strings.dart';
import 'package:readify/features/home/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: AppDimns.medium,
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(AppDimns.medium),
                child: Image.asset(AppImages.onboarding, fit: BoxFit.cover),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.onboardingText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "All of your favorite books are",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "already here",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        },
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.07,
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}
