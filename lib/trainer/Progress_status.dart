import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import '../main.dart';
import 'Customer_list.dart';
import 'trainer_main.dart';
import 'Q&A2.dart';

class ProgressStatus extends StatefulWidget {

  @override
  ProgressStatusState createState() => ProgressStatusState();
}

class ProgressStatusState extends State<ProgressStatus> {
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
        title: '진행현황 페이지',
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
                  child: Text('진행현황', style: TextStyle(fontSize: 15.0)),
                )
              ],
            ),
            elevation: 0.0,
          ),
          body: Container(
            child: Column(
              children: [
                Text('진행현황')
              ]
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
