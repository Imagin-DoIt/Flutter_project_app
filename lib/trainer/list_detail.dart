import 'package:flutter/material.dart';

import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:project2/trainer/trainer_main.dart';
import '../main.dart';
import 'Customer_list.dart';
import 'Progress_status.dart';
import 'Q&A2.dart';
import 'current_situation.dart';
import 'd_record.dart';
import 'e_record.dart';

class ListDetail extends StatefulWidget {

  @override
  ListDetailState createState() => ListDetailState();
}

class ListDetailState extends State<ListDetail> {
  String dropdownValue = '현황';
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        title: '명단상세 페이지',
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
            title: Text('~님'),
            elevation: 0.0,
          ),
          body: Container(
            child: Column(
              children: [
                RaisedButton(
                    child: Row(
                      children: [
                        Text('현황'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CurrentSituation()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Text('운동기록'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ERecord()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Text('식단기록'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DRecord()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Text('진행현황'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProgressStatus()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
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
}
