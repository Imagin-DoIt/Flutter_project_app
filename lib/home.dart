import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: SfCalendar(
              view: CalendarView.week,
              firstDayOfWeek: 7,
              // initialDisplayDate: DateTime(2021, 5, 2, 09, 00),
              // initialSelectedDate: DateTime(2021, 5, 2, 09, 00),
            ),
          ),
        ],
      )
      ,
    );
  }
}


