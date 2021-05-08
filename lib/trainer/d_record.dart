import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import '../main.dart';
import 'Customer_list.dart';
import 'Q&A2.dart';
import 'trainer_main.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';


class DRecord extends StatefulWidget {

  @override
  DRecordState createState() => DRecordState();
}

class DRecordState extends State<DRecord> {
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  late List _selectedEvents;
  late DateTime _selectedDay;

  final Map<DateTime, List> _events = {
    DateTime(2021, 5, 7): [
      {'name': '저녁', 'isDone': true},
    ],
    DateTime(2021, 5, 9): [
      {'name': '아침', 'isDone': true},
      {'name': '점심', 'isDone': true},
    ],
    DateTime(2021, 5, 10): [
      {'name': '아침', 'isDone': true},
      {'name': '점심', 'isDone': true},
    ],
    DateTime(2021, 5, 13): [
      {'name': '아침', 'isDone': true},
      {'name': '점심', 'isDone': true},
      {'name': '저녁', 'isDone': false},
    ],
    DateTime(2021, 5, 25): [
      {'name': '아침', 'isDone': true},
      {'name': '점심', 'isDone': true},
      {'name': '저녁', 'isDone': false},
    ],
    DateTime(2021, 6, 6): [
      {'name': '점심', 'isDone': false},
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        title: '식단기록 페이지',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: MultiLevelDrawer(
            header: Container(
              child: Column(children: <Widget>[
                _createHeader(),
              ]),
            ),
            children: [
              MLMenuItem(
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "스케줄",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("일정")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("관리")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("신청현황")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "회원관리",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomerList()));
                      },
                      submenuContent: Text("명단")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => QA()));
                      },
                      submenuContent: Text("자주하는 Q&A")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "설정",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("식단")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("운동")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.person),
                content: Text(
                  "로그아웃",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ],
          ),
          appBar: AppBar(
            title: Column(
              children: [
                Text('~님', style: TextStyle(fontSize: 25.0)),
                GestureDetector(
                  child: Text('식단기록', style: TextStyle(fontSize: 15.0)),
                )
              ],
            ),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Calendar(
                    startOnMonday: true,
                    weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                    events: _events,
                    onRangeSelected: (range) =>
                        print("Range is ${range.from}, ${range.to}"),
                    onDateSelected: (date) => _handleNewDate(date),
                    isExpandable: true,
                    eventDoneColor: Colors.green,
                    selectedColor: Colors.pink,
                    todayColor: Colors.yellow,
                    eventColor: Colors.grey,
                    dayOfWeekStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 11),
                  ),
                ),
                _buildEventList()
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

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/con.png'),
        backgroundColor: Colors.white,
      ),
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
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {},
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}
