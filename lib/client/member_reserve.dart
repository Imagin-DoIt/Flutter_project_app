import 'package:flutter/material.dart';
import 'package:alert/alert.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class Memberreserve extends StatefulWidget {
  Memberreserve({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => MemberReserveState();
}

class MemberReserveState extends State<Memberreserve> {
  final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1):
        [
      NeatCleanCalendarEvent('PT Day1',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 50),
          description: '피티 시작이다 파이팅!!',
          color: Colors.blue[700]),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
        [
      NeatCleanCalendarEvent('PT Day2',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 10, 50),
          description: '오늘은 벤치프레스 알려줬으면..',
          color: Colors.blue),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 5):
        [
      NeatCleanCalendarEvent('PT Day3',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 5, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 5, 10, 50),
          description: '오늘은 뭘 배울려나',
          color: Colors.blue),
    ],
  };

  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '사용자 수업예약 페이지',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('수업 예약'),
        ),
        body: Center(
          // ignore: deprecated_member_use
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () => Alert(message: '수업이 예약되었습니다.').show(),
                  child: Text('예약'),
                ),
                Calendar(
                  startOnMonday: true,
                  weekDays: ['일', '월', '화', '수', '목', '금', '토'],
                  events: _events,
                  isExpandable: true,
                  eventDoneColor: Colors.green,
                  selectedColor: Colors.blue,
                  todayColor: Colors.blue,
                  eventColor: Colors.orange,
                  locale: 'en_US',
                  todayButtonText: 'Move Today',
                  expandableDateFormat: 'yyyy년 MM월 dd일 EEEE',
                  dayOfWeekStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
                ),
              ],
            ),
        ),
      ),
      ),
    );
  }
}
