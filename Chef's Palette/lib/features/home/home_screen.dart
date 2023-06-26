import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/features/home/widgets/home_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.list), label: ""),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.2),
                ),
                child: SvgPicture.asset(AppImages.home, color: Colors.black),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.heart), label: ""),
        ],
      ),
    );
  }
}
