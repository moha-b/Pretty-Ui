import '../../../core/utils/app_assets.dart';
import 'category_model.dart';

class ServicesModel {
  String id;
  String image;
  String name;
  CategoryModel category;
  int totalRatings;
  double averageRatings;
  double price;
  String? discount;

  ServicesModel({
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.totalRatings,
    required this.averageRatings,
    required this.price,
    this.discount,
  });
}

List<ServicesModel> allServices = [
  ...acRepair,
  ...beautyServices,
  ...paintingServices,
  ...cleaningServices,
  ...plumbingServices,
  ...applianceRepair,
  ...electronicRepair,
  ...shiftingServices,
  ...mensSalonServices
];

List<ServicesModel> acRepair = [
  ServicesModel(
    id: '8',
    image: AppAssets.kApplianceService1,
    name: 'AC Check-Up',
    category: categories[0],
    totalRatings: 5,
    averageRatings: 3.5,
    price: 100.0,
  ),
  ServicesModel(
    id: '9',
    image: AppAssets.kApplianceService2,
    name: 'AC Regular Service',
    category: categories[0],
    totalRatings: 7,
    averageRatings: 4.2,
    price: 80.0,
  ),
  ServicesModel(
    id: '10',
    image: AppAssets.kApplianceService3,
    name: 'AC Installation',
    category: categories[0],
    totalRatings: 3,
    averageRatings: 3.0,
    price: 200.0,
  ),
  ServicesModel(
    id: '11',
    image: AppAssets.kApplianceService4,
    name: 'AC Uninstallation',
    category: categories[0],
    totalRatings: 2,
    averageRatings: 2.5,
    price: 150.0,
  ),
];
List<ServicesModel> beautyServices = [
  ServicesModel(
    id: '12',
    image: AppAssets.kBeautyService1,
    name: 'Haircut',
    category: categories[1],
    totalRatings: 10,
    averageRatings: 4.5,
    price: 50.0,
  ),
  ServicesModel(
    id: '13',
    image: AppAssets.kBeautyService2,
    name: 'Manicure',
    category: categories[1],
    totalRatings: 8,
    averageRatings: 4.0,
    price: 30.0,
  ),
];
List<ServicesModel> paintingServices = [
  ServicesModel(
    id: '17',
    image: AppAssets.kPaintService1,
    name: 'Interior Painting',
    category: categories[3],
    totalRatings: 12,
    averageRatings: 4.8,
    price: 200.0,
  ),
  ServicesModel(
    id: '18',
    image: AppAssets.kPaintService2,
    name: 'Exterior Painting',
    category: categories[3],
    totalRatings: 8,
    averageRatings: 4.5,
    price: 250.0,
  ),
  ServicesModel(
    id: '19',
    image: AppAssets.kPaintService3,
    name: 'Wall Painting',
    category: categories[3],
    totalRatings: 6,
    averageRatings: 4.2,
    price: 150.0,
  ),
];
List<ServicesModel> cleaningServices = [
  ServicesModel(
    id: '1',
    image: AppAssets.kCleaningService1,
    name: 'Home Cleaning',
    category: categories[4],
    totalRatings: 10,
    averageRatings: 4.5,
    price: 50.0,
    discount: '10% OFF',
  ),
  ServicesModel(
    id: '2',
    image: AppAssets.kCleaningService2,
    name: 'Carpet Cleaning',
    category: categories[4],
    totalRatings: 8,
    averageRatings: 4.0,
    price: 35.0,
  ),
  ServicesModel(
    id: '3',
    image: AppAssets.kCleaningService3,
    name: 'House Cleaning',
    category: categories[4],
    totalRatings: 12,
    averageRatings: 4.8,
    price: 60.0,
  ),
];
List<ServicesModel> plumbingServices = [
  ServicesModel(
    id: '20',
    image: AppAssets.kPlumbService1,
    name: 'Pipe Repair',
    category: categories[5],
    totalRatings: 9,
    averageRatings: 4.3,
    price: 120.0,
  ),
  ServicesModel(
    id: '21',
    image: AppAssets.kPlumbService2,
    name: 'Drain Cleaning',
    category: categories[5],
    totalRatings: 11,
    averageRatings: 4.6,
    price: 80.0,
  ),
  ServicesModel(
    id: '22',
    image: AppAssets.kPlumbService3,
    name: 'Toilet Installation',
    category: categories[5],
    totalRatings: 7,
    averageRatings: 4.2,
    price: 200.0,
  ),
  ServicesModel(
    id: '23',
    image: AppAssets.kPlumbService4,
    name: 'Water Heater Repair',
    category: categories[5],
    totalRatings: 5,
    averageRatings: 4.0,
    price: 150.0,
  ),
];
List<ServicesModel> applianceRepair = [
  ServicesModel(
    id: '4',
    image: AppAssets.kApplianceService1,
    name: 'AC Check-Up',
    category: categories[2],
    totalRatings: 5,
    averageRatings: 3.5,
    price: 100.0,
  ),
  ServicesModel(
    id: '5',
    image: AppAssets.kApplianceService2,
    name: 'AC Regular Service',
    category: categories[2],
    totalRatings: 7,
    averageRatings: 4.2,
    price: 80.0,
  ),
  ServicesModel(
    id: '6',
    image: AppAssets.kApplianceService3,
    name: 'AC Installation',
    category: categories[2],
    totalRatings: 3,
    averageRatings: 3.0,
    price: 200.0,
  ),
  ServicesModel(
    id: '7',
    image: AppAssets.kApplianceService4,
    name: 'AC Uninstallation',
    category: categories[2],
    totalRatings: 2,
    averageRatings: 2.5,
    price: 150.0,
  ),
];
List<ServicesModel> electronicRepair = [
  ServicesModel(
    id: '24',
    image: AppAssets.kElectronicService1,
    name: 'Phone Repair',
    category: categories[6],
    totalRatings: 12,
    averageRatings: 4.8,
    price: 100.0,
  ),
  ServicesModel(
    id: '25',
    image: AppAssets.kElectronicService2,
    name: 'Laptop Repair',
    category: categories[6],
    totalRatings: 10,
    averageRatings: 4.6,
    price: 150.0,
  ),
  ServicesModel(
    id: '26',
    image: AppAssets.kElectronicService3,
    name: 'TV Repair',
    category: categories[6],
    totalRatings: 8,
    averageRatings: 4.2,
    price: 200.0,
  ),
  ServicesModel(
    id: '27',
    image: AppAssets.kElectronicService4,
    name: 'Game Console Repair',
    category: categories[6],
    totalRatings: 6,
    averageRatings: 4.0,
    price: 120.0,
  ),
];
List<ServicesModel> shiftingServices = [
  ServicesModel(
    id: '28',
    image: AppAssets.kShiftingService1,
    name: 'House Shifting',
    category: categories[7],
    totalRatings: 15,
    averageRatings: 4.9,
    price: 500.0,
  ),
  ServicesModel(
    id: '29',
    image: AppAssets.kShiftingService2,
    name: 'Office Shifting',
    category: categories[7],
    totalRatings: 12,
    averageRatings: 4.7,
    price: 800.0,
  ),
];
List<ServicesModel> mensSalonServices = [
  ServicesModel(
    id: '30',
    image: AppAssets.kMenSalonService1,
    name: 'Haircut',
    category: categories[8],
    totalRatings: 20,
    averageRatings: 4.5,
    price: 50.0,
  ),
  ServicesModel(
    id: '31',
    image: AppAssets.kMenSalonService2,
    name: 'Beard Trim',
    category: categories[8],
    totalRatings: 18,
    averageRatings: 4.3,
    price: 30.0,
  ),
  ServicesModel(
    id: '32',
    image: AppAssets.kMenSalonService3,
    name: 'Shaving',
    category: categories[8],
    totalRatings: 15,
    averageRatings: 4.2,
    price: 40.0,
  ),
  ServicesModel(
    id: '33',
    image: AppAssets.kMenSalonService4,
    name: 'Facial',
    category: categories[8],
    totalRatings: 12,
    averageRatings: 4.0,
    price: 60.0,
  ),
  ServicesModel(
    id: '34',
    image: AppAssets.kMenSalonService5,
    name: 'Hair Styling',
    category: categories[8],
    totalRatings: 10,
    averageRatings: 4.2,
    price: 70.0,
  ),
];

String loremIpsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sagittis nulla at dapibus ultricies. Suspendisse id massa eget dolor luctus hendrerit eu ac dui.';
