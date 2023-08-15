import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../../calendar/data/events.dart';
import '../../../calendar/screens/widgets/calendar_style.dart';

class CustomCalendarCard extends StatefulWidget {
  final void Function(DateTime?) onDaySelected;

  const CustomCalendarCard({required this.onDaySelected, Key? key})
      : super(key: key);

  @override
  State<CustomCalendarCard> createState() => _CustomCalendarCardState();
}

class _CustomCalendarCardState extends State<CustomCalendarCard> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      widget.onDaySelected(_selectedDay); // Call the callback with selected day
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      shouldFillViewport: true,
      availableGestures: AvailableGestures.none,
      headerStyle: CustomCalendarStyle.getStyle(context),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: AppTypography.kMedium14,
        weekendStyle: AppTypography.kMedium14,
      ),
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        defaultTextStyle: AppTypography.kMedium15,
        holidayTextStyle: AppTypography.kMedium15,
        weekendTextStyle: AppTypography.kMedium15,
        selectedDecoration: const BoxDecoration(
          color: AppColors.kPrimary,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: AppTypography.kMedium13.copyWith(
          color: AppColors.kWhite,
        ),
      ),
      onDaySelected: _onDaySelected,
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
