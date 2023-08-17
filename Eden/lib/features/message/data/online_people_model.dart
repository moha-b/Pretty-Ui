import '../../../core/utils/app_assets.dart';

class OnlinePeople {
  String image;
  String name;

  OnlinePeople({required this.image, required this.name});
}

List<OnlinePeople> onlinePeople = [
  OnlinePeople(
    image: AppAssets.kUser1,
    name: 'Alex',
  ),
  OnlinePeople(
    image: AppAssets.kUser2,
    name: 'Qin',
  ),
  OnlinePeople(
    image: AppAssets.kUser3,
    name: 'Harinder',
  ),
  OnlinePeople(
    image: AppAssets.kUser5,
    name: 'Lilah',
  ),
  OnlinePeople(
    image: AppAssets.kUser6,
    name: 'Martin',
  ),
];
