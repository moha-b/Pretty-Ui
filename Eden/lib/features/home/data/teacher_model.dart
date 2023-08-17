import '../../../core/utils/app_assets.dart';

class TeachersModel {
  String name;
  String bio;
  String image;
  int position;
  TeachersModel({
    required this.name,
    required this.bio,
    required this.image,
    required this.position,
  });
}

List<TeachersModel> bestTeachers = [
  TeachersModel(
    name: 'Martín Abasto',
    bio: 'Illustrator',
    image: AppAssets.kUser3,
    position: 1,
  ),
  TeachersModel(
    name: 'Emmy Elsner',
    bio: 'Design Expert',
    image: AppAssets.kUser6,
    position: 2,
  ),
  TeachersModel(
    name: 'Meng Ru',
    bio: 'Esports Coach',
    image: AppAssets.kUser7,
    position: 3,
  ),
];
