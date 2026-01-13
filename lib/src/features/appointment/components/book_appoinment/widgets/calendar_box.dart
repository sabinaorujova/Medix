import 'package:flutter/material.dart';
import 'selected_date_text.dart';
import 'package:table_calendar/table_calendar.dart';
class CalendarBox extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;
  const CalendarBox({super.key, required this.onDateSelected});

  @override
  State<CalendarBox> createState() => _CalendarBoxState();
}

class _CalendarBoxState extends State<CalendarBox> {
  DateTime? _selectedDay;
  DateTime? _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2024, 4, 3),
          lastDay: DateTime.utc(2026, 12, 31),
          focusedDay: _focusedDay!,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            widget.onDateSelected(selectedDay);
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        SelectedDateText(
          day: ' ${_focusedDay!.day}.',
          month: ' ${_focusedDay!.month}.',
          year: ' ${_focusedDay!.year}',
        ),
      ],
    );
  }
}