import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';

import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'member_my_schedule.dart';
import 'main.dart';
import 'dart:io';
import 'member_chart.dart';
import 'member_reserve.dart';

class Membermain extends StatefulWidget {
  Membermain({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MemberMainState createState() => MemberMainState();
}

class MemberMainState extends State<Membermain> {
  final CalendarWeekController _controller = CalendarWeekController();
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '사용자 메인 페이지',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('사용자 메인 페이지'),
            centerTitle: true,
            elevation: 0.0,
          ),
          drawer: MultiLevelDrawer(
            header: Container(
              child: Column(children: <Widget>[
                _createHeader(),
              ]),
            ),
            children: [
              MLMenuItem(
                leading: Icon(Icons.event),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "스케줄",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Memberchart()));
                      },
                      submenuContent: Text("일정")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Memberreserve()));
                      },
                      submenuContent: Text("예약")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Membermyschedule()));
                      },
                      submenuContent: Text("신청현황")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.edit),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "기록",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Membermain()));
                      },
                      submenuContent: Text("식단")),
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Membermain()));
                      },
                      submenuContent: Text("운동")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.settings),
                content: Text(
                  "설정",
                ),
                onClick: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Membermain()));
                },
              ),
              MLMenuItem(
                leading: Icon(Icons.person),
                content: Text(
                  "로그아웃",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Mainscreen()));
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _controller.jumpToDate(DateTime.now());
              setState(() {});
            },
            child: Icon(Icons.today),
          ),
          body: Column(children: [
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1)
                ]),
                child: CalendarWeek(
                  controller: _controller,
                  height: 100,
                  showMonth: true,
                  minDate: DateTime.now().add(
                    Duration(days: -365),
                  ),
                  maxDate: DateTime.now().add(
                    Duration(days: 365),
                  ),
                  onDatePressed: (DateTime datetime) {
                    // Do something
                    setState(() {});
                  },
                  onDateLongPressed: (DateTime datetime) {
                    // Do something
                  },
                  onWeekChanged: () {
                    // Do something
                  },
                  decorations: [
                    DecorationItem(
                        decorationAlignment: FractionalOffset.bottomRight,
                        date: DateTime.now(),
                        decoration: Icon(
                          Icons.today,
                          color: Colors.blue,
                        )),
                    DecorationItem(
                        date: DateTime.now().add(Duration(days: 1)),
                        decoration: Text(
                          '어린이날',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                )),
            Expanded(
              child: Center(
                child: Text(
                  '${_controller.selectedDate.day}/${_controller.selectedDate.month}/${_controller.selectedDate.year}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ]),
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
                title: Text('알림'),
                icon: Icon(Icons.alarm),
              ),
            ],
          ),
        ));
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/connie1.jpg'),
        backgroundColor: Colors.white,
      ),
      accountName: Text('CONNIE'),
      accountEmail: Text('rladldud1109@naver.com'),
      onDetailsPressed: () {
        print('arrow is clicked');
      },
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0))),
    );
  }
}
