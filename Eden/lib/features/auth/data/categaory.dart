import '../../../core/utils/app_assets.dart';

class Category {
  String id;
  String name;
  String image;
  Category({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<Category> categoriesList = [
  Category(id: '1', name: 'Gaming', image: AppAssets.kGaming),
  Category(id: '2', name: 'Music', image: AppAssets.kMusic),
  Category(id: '3', name: 'Photography', image: AppAssets.kPhotography),
  Category(id: '4', name: 'Art', image: AppAssets.kArt),
  Category(id: '5', name: 'Design', image: AppAssets.kDesign),
  Category(id: '6', name: 'Business', image: AppAssets.kBusiness),
  Category(id: '7', name: 'LifeStyle', image: AppAssets.kLifeStyle),
  Category(id: '8', name: 'Coding', image: AppAssets.kCoding),
];
