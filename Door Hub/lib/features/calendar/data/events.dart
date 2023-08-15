import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

import '../../home/data/category_model.dart';

class Event {
  final String title;
  final CategoryModel category;
  final DateTime fromTime;
  final DateTime toTime;

  const Event({
    required this.title,
    required this.fromTime,
    required this.toTime,
    required this.category,
  });

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  DateTime.utc(2023, 7, 5): [
    Event(
      title: 'Wall Painting Services',
      category: categories[3],
      fromTime: DateTime(2022, 11, 10, 10, 0),
      toTime: DateTime(2022, 11, 10, 12, 0),
    ),
    Event(
      title: 'Dklayut Makeup',
      category: categories[1],
      fromTime: DateTime(2022, 11, 10, 14, 0),
      toTime: DateTime(2022, 11, 10, 16, 0),
    ),
    Event(
      category: categories[8],
      title: 'Multi Mask Facial',
      fromTime: DateTime(2022, 11, 10, 14, 0),
      toTime: DateTime(2022, 11, 10, 16, 0),
    ),
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
