import 'package:chef/core/resources/images.dart';

class OnBoarding {
  final String image;
  final String title;
  final String description;

  OnBoarding(this.image, this.title, this.description);
}

List<OnBoarding> onboardingList = [
  OnBoarding(AppImages.onboarding1, "Cooking techniques",
      "Master basic cooking techniques which can then be used to create an endless variety of dishes"),
  OnBoarding(AppImages.onboarding2, "Online streaming",
      "Master basic cooking techniques which can then be used to create an endless variety of dishes"),
  OnBoarding(AppImages.onboarding3, "Live chat",
      "Master basic cooking techniques which can then be used to create an endless variety of dishes"),
];
