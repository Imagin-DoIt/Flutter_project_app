import 'package:flutter/material.dart';
import '../main.dart';
import 'Customer_list.dart';
import 'Q_A.dart';
import 'trainer_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';

class ERecord extends StatefulWidget {
  ERecord({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ERecordState createState() => ERecordState();
}

class ERecordState extends State<ERecord> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }
  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
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
                    backgroundImage: AssetImage('assets/connie1.jpg'),
                    backgroundColor: Colors.white,
                  ),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/connie2.jpg'),
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
            actions: [IconButton(icon: Icon(Icons.add), onPressed: _showAddDialog)],
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.black,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events,holidays) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)
                ),
                child: Center(
                    child: Text(event,
                      style: TextStyle(color: Colors.blue,
                          fontWeight: FontWeight.bold,fontSize: 16),)
                ),
              ),
            )),
          ],
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
  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white70,
          title: Text("Add Events"),
          content: TextField(
            controller: _eventController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Save",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
              onPressed: () {
                if (_eventController.text.isEmpty) return;
                setState(() {
                  if (_events[_controller.selectedDay] != null) {
                    _events[_controller.selectedDay]
                        .add(_eventController.text);
                  } else {
                    _events[_controller.selectedDay] = [
                      _eventController.text
                    ];
                  }
                  prefs.setString("events", json.encode(encodeMap(_events)));
                  _eventController.clear();
                  Navigator.pop(context);
                });

              },
            )
          ],
        ));
  }
}
