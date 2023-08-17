import '../../../core/utils/app_assets.dart';

class Onboarding {
  String title;
  String description;
  String image;
  Onboarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
    title: 'Anyone can share\nand sell skills',
    image: AppAssets.kOnboarding1,
    description:
        'Teaching online shouldn’t be\ncomplicated and expensive. Learn\nEden makes it free and easy.',
  ),
  Onboarding(
    title: 'Run your business\nanywhere',
    image: AppAssets.kOnboarding2,
    description:
        'Learn Eden helps you find students,\ndrive sales, and manage your\nday-to-day.',
  ),
  Onboarding(
    image: AppAssets.kOnboarding3,
    title: 'Discover new\nlearning opportunities',
    description:
        'Expand your knowledge and\nexplore a wide range of subjects\non Learn Eden.',
  ),
];
