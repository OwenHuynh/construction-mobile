import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCustom extends StatefulWidget {
  const CalendarCustom({
    super.key,
    required this.focusedDay,
    this.selectedDayPredicate,
    this.onDaySelected,
    this.locale = 'en_US',
    required this.firstDay,
    required this.lastDay,
    this.selectedDayColor,
    this.todayColor,
  });

  final DateTime focusedDay;
  final DateTime firstDay;
  final DateTime lastDay;
  final Color? selectedDayColor;
  final Color? todayColor;
  final OnDaySelected? onDaySelected;
  final bool Function(DateTime day)? selectedDayPredicate;
  final String? locale;

  @override
  State<CalendarCustom> createState() => _CalendarCustomState();
}

class _CalendarCustomState extends State<CalendarCustom> {
  late final PageController _pageController;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _onLeftChevronTap() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _onRightChevronTap() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _onCalendarFormatTap() {
    if (_calendarFormat == CalendarFormat.month) {
      setState(() {
        _calendarFormat = CalendarFormat.week;
      });
    } else {
      setState(() {
        _calendarFormat = CalendarFormat.month;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onCalendarCreated: (pageController) {
        _pageController = pageController;
      },
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, focusedMonth) {
          final text = DateFormat.yMMMM(widget.locale).format(focusedMonth);
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: const TextStyle(fontSize: 17),
            ),
          );
        },
      ),
      headerStyle: HeaderStyle(
        leftChevronVisible: false,
        formatButtonVisible: false,
        rightChevronPadding: EdgeInsets.zero,
        rightChevronIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: _onCalendarFormatTap,
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: _onLeftChevronTap,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 15,
              ),
            ),
            IconButton(
              onPressed: _onRightChevronTap,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15,
              ),
            ),
          ],
        ),
      ),
      //headerVisible: true,
      calendarStyle: CalendarStyle(
        markerMargin: const EdgeInsets.all(15),
        weekendTextStyle: const TextStyle(color: Colors.redAccent),
        selectedDecoration: BoxDecoration(
            color: widget.selectedDayColor ?? Colors.blue,
            shape: BoxShape.circle),
        todayDecoration: BoxDecoration(
            color: widget.todayColor ?? Colors.redAccent[100],
            shape: BoxShape.circle),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.redAccent),
      ),
      firstDay: widget.firstDay,
      lastDay: widget.lastDay,
      focusedDay: widget.focusedDay,
      calendarFormat: _calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      selectedDayPredicate: widget.selectedDayPredicate,
      onDaySelected: widget.onDaySelected,
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      locale: widget.locale,
    );
  }
}
