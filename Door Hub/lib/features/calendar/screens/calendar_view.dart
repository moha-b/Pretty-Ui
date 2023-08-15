import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/features/calendar/screens/widgets/calendar_marker_builder.dart';
import 'package:door_hub/features/calendar/screens/widgets/calendar_style.dart';
import 'package:door_hub/features/calendar/screens/widgets/events_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/utils/utils.dart';
import '../data/events.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                const CustomHeaderText(text: 'Calendar'),
                const Spacer(),
                CustomButton(
                  onTap: () {},
                  icon: AppAssets.kEdit,
                  text: 'Filter',
                )
              ],
            ),
            SizedBox(height: 21.h),
            PrimaryContainer(
              child: TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                availableGestures: AvailableGestures.none,
                headerStyle: CustomCalendarStyle.getStyle(context),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: AppTypography.kMedium14,
                  weekendStyle: AppTypography.kMedium14,
                ),
                calendarFormat: CalendarFormat.month,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (BuildContext context, date, events) {
                    return CustomMarkerBuilder(events: events);
                  },
                ),
                calendarStyle: CustomCalendarStyle.calendarStyle(),
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),
            SizedBox(height: 20.h),
            PrimaryContainer(
              child: Column(
                children: [
                  CustomHeaderText(
                    text: DateFormat('dd MMMM, yyyy').format(_focusedDay),
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 20.h),
                  ValueListenableBuilder<List<Event>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.separated(
                        itemCount: value.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Divider(),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final event = value[index];
                          return EventCard(
                            event: event,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
