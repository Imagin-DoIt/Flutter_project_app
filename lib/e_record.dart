import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'main.dart';
import 'Customer_list.dart';
import 'Q_A.dart';
import 'trainer_main.dart';

class ERecord extends StatefulWidget {
  ERecord({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ERecordState createState() => ERecordState();
}

class ERecordState extends State<ERecord> {
  final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      NeatCleanCalendarEvent('운동A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          color: Colors.black)
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      NeatCleanCalendarEvent('운동B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+2, 12, 0),
          color: Colors.red),
      NeatCleanCalendarEvent('운동F',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+2, 17, 0),
          color: Colors.red[200])
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
        [
      NeatCleanCalendarEvent('운동C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 12, 0),
          color: Colors.orange),
      NeatCleanCalendarEvent('운동D',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 12, 0),
          color: Colors.orange[300]),
      NeatCleanCalendarEvent('운동E',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 12, 0),
          color: Colors.orange[200]),
      NeatCleanCalendarEvent('운동H',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 12, 0),
          color: Colors.orange[100]),
      NeatCleanCalendarEvent('운동J',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day+3, 12, 0),
          color: Colors.orange[50]),
    ]
  };

  @override
  void initState() {
    super.initState();
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '운동기록 페이지',
        home: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/con.png'),
                    backgroundColor: Colors.white,
                  ),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/con.png'),
                      backgroundColor: Colors.white,
                    ),
                  ],
                  accountName: Text('CONNIE'),
                  accountEmail: Text('rladldud1109@naver.com'),
                  onDetailsPressed: () {
                    print('arrow is clicked');
                  },
                  decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0))),
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.event,
                    color: Colors.grey[850],
                  ),
                  title: Text('스케줄'),
                  children: <Widget>[
                    ListTile(
                        title: Text('일정'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Trainermain()));
                        }),
                    ListTile(
                        title: Text('관리'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Trainermain()));
                        }),
                    ListTile(
                        title: Text('신청현황'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Trainermain()));
                        }),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.grey[850],
                  ),
                  title: Text('회원관리'),
                  children: <Widget>[
                    ListTile(
                        title: Text('명단'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CustomerList()));
                        }),
                    ListTile(
                        title: Text('Q&A'),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => QA()));
                        }),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey[850],
                  ),
                  title: Text('설정'),
                ),
                ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.grey[850],
                    ),
                    title: Text('로그아웃'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Mainscreen()));
                    }),
              ],
            ),
          ),
          appBar: AppBar(
            title: Column(
              children: [
                Text('~님', style: TextStyle(fontSize: 25.0)),
                GestureDetector(
                  child: Text('운동기록', style: TextStyle(fontSize: 15.0)),
                )
              ],
            ),
            elevation: 0.0,
          ),
          body: SafeArea(child: Calendar(
                    startOnMonday: true,
                    weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                    events: _events,
                    isExpandable: true,
                    eventDoneColor: Colors.green,
                    selectedColor: Colors.pink,
                    todayColor: Colors.yellow,
                    eventColor: Colors.grey,
                    locale: 'de_De',
                    todayButtonText: 'Heate',
                    isExpanded: true,
                    expandableDateFormat: 'EEEE, DD. MMMM yyyy',
                    dayOfWeekStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 11),
                  ),
                ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            currentIndex: _index,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                title: Text('홈'),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text('채팅'),
                icon: Icon(Icons.chat),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text('알림'),
              ),
            ],
          ),
        ));
  }

  void _handleNewDate(date) {
    print('Date Selected: $date');
  }
}
