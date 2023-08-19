import 'package:foochi/core/utils/utils.dart';

class UserModel {
  String id;
  String name;
  String profilePic;
  String email;
  String phoneNumber;
  String address;
  UserModel({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });
}

UserModel currentUser = UserModel(
    id: '123456789',
    name: 'Tony Nguyen',
    email: 'cuonght@gmail.com',
    phoneNumber: '034 455 45443 ',
    profilePic: AppAssets.kProfilePic,
    address: '004 Riley Street, 2050 Sydney');

UserModel courierUser = UserModel(
    id: '309356789',
    name: 'David Jame',
    email: 'cuonght@gmail.com',
    phoneNumber: '034 455 45443 ',
    profilePic: AppAssets.kProfilePic2,
    address: '004 Riley Street, 2050 Sydney');
