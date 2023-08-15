class NotificationModel {
  String id;
  NotificationType type;
  String notificationAbout;
  String notificationMessage;
  String notificationInfo;
  DateTime notificationTime;
  NotificationModel({
    required this.id,
    required this.type,
    required this.notificationAbout,
    required this.notificationMessage,
    required this.notificationInfo,
    required this.notificationTime,
  });
}

enum NotificationType {
  orderCancel,
  orderDone,
  orderBooked,
  orderPaid,
  orderTime
}

List<NotificationModel> notificationsList = [
  NotificationModel(
    id: '1',
    type: NotificationType.orderPaid,
    notificationAbout: 'AC Installation (Both) ',
    notificationMessage: 'service payment is successfully ',
    notificationInfo: 'Paid.',
    notificationTime:
        DateTime.now().subtract(const Duration(seconds: 10)), 
  ),
  NotificationModel(
    id: '2',
    type: NotificationType.orderBooked,
    notificationAbout: 'Booking Status ',
    notificationMessage: 'has been changed ',
    notificationInfo: '3:00-4:00 PM',
    notificationTime: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    id: '3',
    type: NotificationType.orderDone,
    notificationAbout: 'Confirmed ',
    notificationMessage: 'Your booking ',
    notificationInfo: 'AC Installation',
    notificationTime: DateTime.now().subtract(const Duration(days: 2)),
  ),
  NotificationModel(
    id: '4',
    type: NotificationType.orderTime,
    notificationAbout: 'Hair Style ',
    notificationMessage: 'Professional Coming today ',
    notificationInfo: '2:00-3:00 PM.',
    notificationTime: DateTime.now().subtract(const Duration(days: 6)),
  ),
  NotificationModel(
    id: '5',
    type: NotificationType.orderCancel,
    notificationAbout: 'Order Cancelled! ',
    notificationMessage: 'Home Deep Cleaning ',
    notificationInfo: 'Westinghouse.',
    notificationTime: DateTime.now().subtract(const Duration(days: 15)),
  ),
];
