import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/home/home_screen.dart';
import 'package:chef/features/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimns.medium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.outlined(
                  onPressed: () {},
                  color: AppColors.background,
                  icon:
                      SvgPicture.asset(AppImages.arrowLeft, fit: BoxFit.cover),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(AppDimns.medium),
                    alignment: Alignment.centerRight,
                    child: const Text("Skip"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                  controller: controller,
                  itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(onboardingList[index].image,
                              height: getScreenHeight(360),
                              width: double.infinity,
                              fit: BoxFit.cover),
                          SizedBox(height: getScreenHeight(AppDimns.big)),
                          Flexible(
                            child: Text(
                              onboardingList[index].title,
                              style: const TextStyle(
                                  fontSize: 30,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: getScreenHeight(AppDimns.medium)),
                          Flexible(
                            child: Text(
                              onboardingList[index].description,
                              style: TextStyle(
                                  fontSize: 20,
                                  wordSpacing: 2,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                        ],
                      ),
                  itemCount: onboardingList.length),
            ),
            SizedBox(
              width: double.infinity,
              height: getScreenHeight(50),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            SizedBox(height: getScreenHeight(AppDimns.big)),
          ],
        ),
      ),
    );
  }
}
