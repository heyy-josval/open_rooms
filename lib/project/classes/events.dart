import 'dart:collection';

import 'package:open_rooms/project/classes/date_day.dart';
import 'package:open_rooms/project/classes/event.dart';
import 'package:table_calendar/table_calendar.dart';

//TODO: Implementar el map nuevo con la clase creada "DateDay" integrado con RealTime Database.
final events = Map<DateDay, List<Event>>;

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
