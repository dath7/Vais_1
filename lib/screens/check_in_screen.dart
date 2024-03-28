// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  var _selectedTime = DateTime.now();
  var _pickedTime;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        toolbarHeight: size.height * 0.1,
        flexibleSpace: Container(
          // color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.teal),
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text("Tất cả"),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text(
                "Tháng này",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: size.width * 0.3,
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.teal),
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${_selectedTime.month}/${_selectedTime.year}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                margin:
                                    EdgeInsets.only(bottom: size.height * 0.1),
                                height: size.height * 0.3,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedTime = _pickedTime;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Xong")),
                                    ),
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        initialDateTime: _selectedTime,
                                        maximumYear: DateTime.now().year,
                                        minimumDate: DateTime(2020),
                                        mode: CupertinoDatePickerMode.monthYear,
                                        onDateTimeChanged: (date) {
                                          _pickedTime = date;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.teal,
                        ))
                  ]),
            ),
          ]),
        ),
      ),
      body: Column(
        children: [
          const Card(
            elevation: 0,
            margin: EdgeInsets.all(0),
            shape: InputBorder.none,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                backgroundImage:
                    NetworkImage("https://picsum.photos/250?image=646"),
              ),
              title: Text(
                "User 1",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Lớp A"),
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.rectangle),
            child: ListView(
              children: const [
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
                CheckinItem(
                    time: "27/03/2024 Thứ Tư",
                    inTime: "08:44 AM",
                    outTime: "11:44 AM"),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CheckinItem extends StatelessWidget {
  final String time;
  final String inTime;
  final String outTime;
  const CheckinItem({
    super.key,
    required this.time,
    required this.inTime,
    required this.outTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.rectangle,
            ),
            child: const Text(
              "Vào",
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                inTime,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                outTime,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          subtitle: FDottedLine(
            color: Colors.amber,
            width: 100,
            strokeWidth: 2.0,
            dottedLength: 10.0,
            space: 2.0,
          ),
          trailing: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.rectangle,
            ),
            child: const Text(
              "Ra",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
