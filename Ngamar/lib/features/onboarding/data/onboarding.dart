import 'package:ngamar/core/core.dart';

class Onboarding {
  String bgImage;
  String title;
  String info;
  Onboarding({
    required this.bgImage,
    required this.title,
    required this.info,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
    bgImage: AppAssets.kOnboardingFirst,
    title: 'Goods with guaranteed quality',
    info:
        'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingSecond,
    title: "Total warranty if the product doesn't fit",
    info:
        'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ',
  ),
];
