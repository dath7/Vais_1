import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:school_app/utils/calendar/event.dart';
import 'package:table_calendar/table_calendar.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  var _selectedDay = DateTime.now();
  var _focusedDay = DateTime.now();

  Map<DateTime, List<Event>> selectedEvents = {
    DateTime.utc(2024, 03, 27): [
      Event(
          startTime: "06:45",
          endTime: "09:15",
          title: "Môn Toán",
          subTitle:
              "${DateFormat('EEEE', 'vi_VI').format(DateTime.utc(2024, 03, 27))}:   Tiết 1-3"),
      Event(
          startTime: "09:25",
          endTime: "11:45",
          title: "Môn Văn",
          subTitle:
              "${DateFormat('EEEE', 'vi_VI').format(DateTime.utc(2024, 03, 27))}:   Tiết 4-6")
    ],
    DateTime.utc(2024, 03, 28): [
      Event(
          startTime: "06:45",
          endTime: "09:15",
          title: "Môn Toán",
          subTitle:
              "${DateFormat('EEEE', 'vi_VI').format(DateTime.utc(2024, 03, 28))}:   Tiết 1-3"),
      Event(
          startTime: "09:25",
          endTime: "11:45",
          title: "Môn Văn",
          subTitle:
              "${DateFormat('EEEE', 'vi_VI').format(DateTime.utc(2024, 03, 28))}:   Tiết 4-6")
    ],
    DateTime.utc(2024, 04, 28): [
      Event(
          startTime: "06:45",
          endTime: "09:15",
          title: "Môn Toán",
          subTitle:
              "${DateFormat('EEEE', 'vi_VI').format(DateTime.utc(2024, 04, 28))}:   Tiết 1-3"),
      Event(
          startTime: "09:25",
          endTime: "11:45",
          title: "Môn Văn",
          subTitle:
              "${DateFormat('EEEE', 'vi_VI').format(DateTime.utc(2024, 04, 28))}:   Tiết 4-6")
    ],
  };

  List<Event> _getEventsForDay(DateTime day) {
    // not in current page
    if (day.month != _focusedDay.month) {
      return [];
    } else {
      return selectedEvents[day] ?? [];
    }
  }

  @override
  void initState() {
    _getEventsForDay(_selectedDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(tabs: [
            Tab(child: Text("Thời khóa biểu")),
            Tab(child: Text("Danh sách lớp")),
          ]),
        ),
        body: TabBarView(
          children: [
            ListView(children: [
              TableCalendar(
                // eventLoader: (day) {
                //   if (day.weekday == DateTime.monday) {
                //     return [Event('Cyclic event')];
                //   }

                //   return [];
                // },
                eventLoader: _getEventsForDay,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // print(selectedDay);
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well to back
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay =
                        focusedDay; // call setState to call again getEventForDays when change page
                  });
                },
                headerStyle: const HeaderStyle(
                    leftChevronIcon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.teal,
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.teal,
                    ),
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    headerMargin: EdgeInsets.only(bottom: 15)),
                locale: "vi_VI",
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
              ),
              ..._getEventsForDay(_selectedDay).map((Event e) => Card(
                    color: Colors.amber.shade100,
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: size.width * 0.15,
                        child: Column(
                          children: [
                            Text(e.startTime),
                            const Expanded(child: VerticalDivider()),
                            Text(e.endTime)
                          ],
                        ),
                      ),
                      title: Text(
                        e.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        e.subTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic),
                      ),
                      trailing: const IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: null,
                      ),
                    ),
                  ))
            ]),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Card(
                  child: ListTile(
                    title: Text("Môn X"),
                    subtitle: Text("Giáo viên Y"),
                    trailing: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
