import '../../../core/utils/app_assets.dart';

class PropertyType {
  String id;
  String image;
  String name;
  PropertyType({required this.id, required this.image, required this.name});
}

List<PropertyType> properties = [
  PropertyType(id: '1', image: AppAssets.kHome, name: 'Home'),
  PropertyType(id: '1', image: AppAssets.kOffice, name: 'Office'),
  PropertyType(id: '1', image: AppAssets.kVila, name: 'Vila'),
];
