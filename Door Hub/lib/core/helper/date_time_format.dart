import 'package:intl/intl.dart';

class CustomDateTimeFormat {
  static String notificationDateFormat(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference < const Duration(minutes: 1)) {
      return 'Just Now';
    } else if (difference < const Duration(hours: 1)) {
      return DateFormat('h:mm a').format(date);
    } else if (difference < const Duration(days: 1)) {
      return DateFormat('h:mm a').format(date);
    } else if (difference < const Duration(days: 7)) {
      return '${DateFormat('EEEE, MMM d').format(date)} at ${DateFormat('h:mm a').format(date)}';
    } else {
      return '${DateFormat('MMM d, y').format(date)} at ${DateFormat('h:mm a').format(date)}';
    }
  }

  static String timeFormat(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }
}
