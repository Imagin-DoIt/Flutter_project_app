import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:project2/main.dart';

import 'Customer_list.dart';
import 'Q&A2.dart';

class TrainerMainPage extends StatefulWidget {

  @override
  _TrainerMainPageState createState() => _TrainerMainPageState();
}

class _TrainerMainPageState extends State<TrainerMainPage> {
  @override
  void initState() {
    super.initState();
  }
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '관리자 메인 페이지',
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
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("일정")),
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrainerMainPage()));
                  }, submenuContent: Text("관리")),
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrainerMainPage()));
                  }, submenuContent: Text("신청현황")),
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
                      submenuContent:  Text("명단")),
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => QA()));
                  }, submenuContent: Text("자주하는 Q&A")),
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
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrainerMainPage()));
                  }, submenuContent: Text("운동")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.exit_to_app),
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
          body: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50.0, child: Icon(Icons.account_circle)),
                        SizedBox(height: 50.0, child: Icon(Icons.account_circle)),
                        SizedBox(height: 50.0, child: Icon(Icons.account_circle)),
                        Icon(Icons.add_circle_outline)
                      ],
                    ),
                  ],
                ),
              )),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            currentIndex: _index,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: '홈',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: '채팅',
                icon: Icon(Icons.chat),
              ),
              BottomNavigationBarItem(
                label: '알림',
                icon: Icon(Icons.notifications),
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
