import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/images.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:helia/features/home/widgets/custom_navigation_bar.dart';
import 'package:helia/features/home/widgets/home_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
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
      body: const HomeBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
