import 'package:flutter/material.dart';
import 'main.dart';
import 'Customer_list.dart';
import 'Q&A2.dart';
import 'trainer_main.dart';

class ProgressStatus extends StatefulWidget {
  ProgressStatus({Key key, this.title}) : super(key: key);
  final String title;

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
                  title:Text('일정'),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Trainermain()));}
                ),ListTile(title:Text('관리'),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Trainermain()));}
                ),
                ListTile(title:Text('신청현황'),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Trainermain()));}
                ),],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey[850],
              ),
              title: Text('회원관리'),
              children: <Widget>[
                ListTile(title:Text('명단'),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomerList()));}
                ),
                ListTile(title:Text('Q&A'),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QA()));}
                ),],
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
              title: Text('로그아웃'),onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Mainscreen()));}
            ),
          ],
        ),
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
}
