import '../../home/data/services_model.dart';
import '../../profile/data/user_model.dart';

class BookingModel {
  String id;
  String referenceCode;
  BookingStatus status;
  DateTime fromDate;
  DateTime toDate;
  UserModel serviceProvider;
  ServicesModel service;
  BookingModel({
    required this.id,
    required this.referenceCode,
    required this.status,
    required this.fromDate,
    required this.toDate,
    required this.serviceProvider,
    required this.service,
  });
}

enum BookingStatus { confirmed, complete, pending, draft }

List<BookingModel> upcomingBookings = [
  BookingModel(
      id: '1',
      referenceCode: 'ABC123',
      status: BookingStatus.confirmed,
      fromDate: DateTime.now().add(const Duration(days: 1)),
      toDate: DateTime.now().add(const Duration(days: 2)),
      serviceProvider: serviceProvider,
      service: acRepair[1]),
  BookingModel(
      id: '2',
      referenceCode: 'XYZ789',
      status: BookingStatus.pending,
      fromDate: DateTime.now().add(const Duration(days: 3)),
      toDate: DateTime.now().add(const Duration(days: 4)),
      serviceProvider: serviceProvider,
      service: mensSalonServices[1]),
];

List<BookingModel> historyBookings = [
  BookingModel(
      id: '3',
      referenceCode: 'JKM637',
      status: BookingStatus.complete,
      fromDate: DateTime.now().add(const Duration(days: 1)),
      toDate: DateTime.now().add(const Duration(days: 2)),
      serviceProvider: serviceProvider,
      service: paintingServices[1]),
  BookingModel(
      id: '4',
      referenceCode: 'XYZ789',
      status: BookingStatus.complete,
      fromDate: DateTime.now().add(const Duration(days: 3)),
      toDate: DateTime.now().add(const Duration(days: 4)),
      serviceProvider: serviceProvider,
      service: shiftingServices[1]),
];

List<BookingModel> draftsBookings = [
  BookingModel(
      id: '5',
      referenceCode: 'PKO295',
      status: BookingStatus.draft,
      fromDate: DateTime.now().add(const Duration(days: 1)),
      toDate: DateTime.now().add(const Duration(days: 2)),
      serviceProvider: serviceProvider,
      service: beautyServices[1]),
  BookingModel(
      id: '6',
      referenceCode: 'MNL3512',
      status: BookingStatus.draft,
      fromDate: DateTime.now().add(const Duration(days: 3)),
      toDate: DateTime.now().add(const Duration(days: 4)),
      serviceProvider: serviceProvider,
      service: applianceRepair[1]),
];
