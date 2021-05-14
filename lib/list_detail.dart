import 'package:flutter/material.dart';
import 'Progress_status.dart';
import 'current_situation.dart';
import 'd_record.dart';
import 'e_record.dart';
import 'main.dart';
import 'Customer_list.dart';
import 'Q_A.dart';
import 'trainer_main.dart';

class ListDetail extends StatefulWidget {
  ListDetail({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ListDetailState createState() => ListDetailState();
}

class ListDetailState extends State<ListDetail> {
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '명단상세 페이지',
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
            title: Text('~님'),
            elevation: 0.0,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
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
}
