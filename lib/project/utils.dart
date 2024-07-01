// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;
  final String teacher;
  final String subject;
  final TimeOfDay start;
  final TimeOfDay end;

  const Event(this.title, this.teacher, this.subject, this.start, this.end);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'teacher': teacher,
      'subject': subject,
      'start': _timeOfDayToString(start),
      'end': _timeOfDayToString(end),
    };
  }

  String _timeOfDayToString(TimeOfDay time) {
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String startString() {
    return _timeOfDayToString(start);
  }

  String endString() {
    return _timeOfDayToString(end);
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
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

DateTime roundStartTime(DateTime dateTime) {
  int roundedHours = dateTime.minute >= 30 ? dateTime.hour + 1 : dateTime.hour;

  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    roundedHours,
    0,
  );
}

DateTime roundEndTime(DateTime dateTime) {
  int adjustedHours = dateTime.hour + 2;
  int roundedHours = dateTime.minute >= 30 ? adjustedHours + 1 : adjustedHours;

  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    roundedHours,
    0,
  );
}
