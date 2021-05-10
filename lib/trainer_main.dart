import 'package:flutter/material.dart';
import 'main.dart';

class Trainermain extends StatefulWidget {
  Trainermain({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TrainerMainState createState() => TrainerMainState();
}

class TrainerMainState extends State<Trainermain> {
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '관리자 메인 페이지',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('관리자 메인 페이지'),
            centerTitle: true,
            elevation: 0.0,
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('스케줄'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.assignment_ind),
                    title: Text('명단'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.article),
                    title: Text('공지사항'),
                    onTap: () {}),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                        child: Text('로그아웃'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mainscreen()));
                        })
                  ],
                )
              ],
            ),
          ),
          body: Center(
              child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(height: 30.0, child: Icon(Icons.account_circle)),
                    SizedBox(height: 30.0, child: Icon(Icons.account_circle)),
                    SizedBox(height: 30.0, child: Icon(Icons.account_circle)),
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
                title: Text('홈'),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text('채팅'),
                icon: Icon(Icons.chat),
              ),
              BottomNavigationBarItem(
                title: Text('명단'),
                icon: Icon(Icons.assignment_ind),
              ),
            ],
          ),
        ));
  }
}
