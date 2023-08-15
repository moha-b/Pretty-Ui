import '../../../core/utils/app_assets.dart';

class Onboarding {
  String image;
  String title;
  String description;

  Onboarding(
      {required this.description, required this.image, required this.title});
}

List<Onboarding> onboardingList = [
  Onboarding(
      description:
          'Lorem ipsum is a placeholder text commonly\nused to demonstrate the visual.',
      image: AppAssets.kOnboardingFirst,
      title: 'Beauty parlour\nat your home'),
  Onboarding(
      description:
          'Lorem ipsum is a placeholder text commonly\nused to demonstrate the visual.',
      image: AppAssets.kOnboardingSecond,
      title: ' Plumber & expart\nnearby you'),
  Onboarding(
      description:
          'Lorem ipsum is a placeholder text commonly\nused to demonstrate the visual.',
      image: AppAssets.kOnboardingThird,
      title: 'Professional home\ncleaning')
];
