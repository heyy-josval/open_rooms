import 'package:flutter/material.dart';
import 'package:open_rooms/project/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventTeacherController = TextEditingController();
  final TextEditingController _eventSubjectController = TextEditingController();

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

  void _addEvent() {
    final newEvent = Event(
      _eventTitleController.text,
      _eventTeacherController.text,
      _eventSubjectController.text,
    );

    if (kEvents[_selectedDay] != null) {
      kEvents[_selectedDay]!.add(newEvent);
    } else {
      kEvents[_selectedDay!] = [newEvent];
    }

    setState(() {
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    });

    _eventTitleController.clear();
    _eventTeacherController.clear();
    _eventSubjectController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Reservas",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Añadir reserva"),
                  ],
                ),
                actions: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _addEvent();
                        Navigator.of(context).pop();
                        _selectedEvents.value = _getEventsForDay(_selectedDay!);
                      },
                      child: const Text("Añadir"),
                    ),
                  ),
                ],
                content: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _eventTitleController,
                        decoration: const InputDecoration(
                          hintText: "Título de la clase",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: _eventTeacherController,
                        decoration: const InputDecoration(
                          hintText: "Docente a cargo",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: _eventSubjectController,
                        decoration: const InputDecoration(
                          hintText: "Asignatura",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TableCalendar(
              headerStyle: HeaderStyle(
                rightChevronIcon: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                leftChevronIcon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                formatButtonDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue.withOpacity(0.2),
                ),
              ),
              locale: 'en_US',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: _calendarFormat,
              eventLoader: _getEventsForDay,
              calendarBuilders: CalendarBuilders(
                singleMarkerBuilder: (context, date, _) {
                  return Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    width: 4.0,
                    height: 4.0,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                  );
                },
              ),
              calendarStyle: CalendarStyle(
                todayTextStyle: const TextStyle(color: Colors.white),
                defaultTextStyle: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                outsideDaysVisible: false,
                selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.4),
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _selectedEvents.value = _getEventsForDay(selectedDay);
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          // ignore: avoid_print
                          onTap: () => print("${value[index]}"),
                          title: Text(
                            "${value[index]}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
