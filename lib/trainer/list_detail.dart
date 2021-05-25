import 'package:flutter/material.dart';
import 'current_situation.dart';
import 'd_record.dart';
import 'e_record.dart';
import '../main.dart';
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
