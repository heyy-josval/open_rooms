// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

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
