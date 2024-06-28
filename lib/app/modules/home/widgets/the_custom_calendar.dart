import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

Widget theCustomCalendar({
  required DateTime firstDay,
  required DateTime lastDay,
  required DateTime focusedDay,
  required bool multipleSelection,
  required CalendarFormat calendarFormat,
  required Function(CalendarFormat) onFormatChanged,
  required bool Function(DateTime) selectedDayPredicate,
  required Function(DateTime, DateTime) onDaySelected,
}) {
  return TableCalendar(
    firstDay: firstDay,
    lastDay: lastDay,
    focusedDay: focusedDay,
    calendarFormat: calendarFormat,
    onFormatChanged: onFormatChanged,
    selectedDayPredicate: selectedDayPredicate,
    onDaySelected: onDaySelected,
    headerVisible: true,
    weekNumbersVisible: false,
    headerStyle: HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: TextStyle(
        color: const Color(0xFF1F2020),
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      leftChevronIcon: const Icon(
        Icons.chevron_left,
        color: Color(0xFF1F2020),
      ),
      rightChevronIcon: const Icon(
        Icons.chevron_right,
        color: Color(0xFF1F2020),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFDADBDC),
            width: 1.sp,
          ),
        ),
      ),
    ),
    daysOfWeekHeight: 40.h,
    daysOfWeekStyle: DaysOfWeekStyle(
      weekdayStyle: TextStyle(
        color: const Color(0xFF1F2020),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      weekendStyle: TextStyle(
        color: const Color(0xFF1F2020),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
    daysOfWeekVisible: true,
    calendarStyle: CalendarStyle(
      outsideDaysVisible: false,
      weekendTextStyle: TextStyle(
        color: const Color(0xFF1F2020),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      todayTextStyle: TextStyle(
        color: const Color(0xFF1F2020),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      selectedTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      todayDecoration: const BoxDecoration(
        color: Color(0xFFABD02B),
        shape: BoxShape.circle,
      ),
      selectedDecoration: const BoxDecoration(
        color: Color(0xFFABD02B),
        shape: BoxShape.circle,
      ),
    ),
    currentDay: DateTime.now(),
    calendarBuilders: CalendarBuilders(
      selectedBuilder: (context, date, events) {
        return Container(
          height: 32.h,
          width: 32.w,
          margin: EdgeInsets.only(
            top: 4.h,
            bottom: 10.h,
            right: 4.w,
            left: 4.w,
          ),
          padding: EdgeInsets.only(top: 7.sp),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFABD02B),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: const Color(0xFF004D41),
              ),
            ),
          ),
        );
      },
      todayBuilder: (context, date, events) {
        return Container(
          height: 32.h,
          width: 32.w,
          margin: EdgeInsets.only(
            top: 4.h,
            bottom: 10.h,
            right: 4.w,
            left: 4.w,
          ),
          padding: EdgeInsets.only(top: 7.sp),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFEEF6D5),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: const Color(0xFF004D41),
              ),
            ),
          ),
        );
      },
    ),
  );
}
