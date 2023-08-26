import 'package:ngamar/core/core.dart';

class NotificationModel {
  String title;
  String notificationDateTime;
  String notificationMessage;
  String notificationId;
  NotificationType notificationType;
  NotificationModel({
    required this.title,
    required this.notificationDateTime,
    required this.notificationMessage,
    required this.notificationId,
    required this.notificationType,
  });
}

List<NotificationModel> notificationList = [
  NotificationModel(
    title: 'New Update',
    notificationDateTime: '6/11/2023',
    notificationMessage:
        'Great news! Update available for Ngamar. Get the latest features and improvements now. Tap ',
    notificationId: '1',
    notificationType: NotificationType.update,
  ),
  NotificationModel(
    title: 'Receipt',
    notificationDateTime: '5/11/2023',
    notificationMessage:
        'Congratulations! Your purchase receipt for Premium Sofa is now available. ',
    notificationId: '2',
    notificationType: NotificationType.payment,
  ),
  NotificationModel(
    title: 'Success',
    notificationDateTime: '3/11/2023',
    notificationMessage:
        'Congratulations! You Successfully purchased Accent Wooden Chairs',
    notificationId: '3',
    notificationType: NotificationType.release,
  ),
];
