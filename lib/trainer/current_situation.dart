import 'package:flutter/material.dart';

class CurrentSituation extends StatefulWidget {
  CurrentSituation({Key key, this.title}) : super(key: key);
  final String title;

  @override
  CurrentSituationState createState() => CurrentSituationState();
}

class CurrentSituationState extends State<CurrentSituation> {
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
        title: '현황 페이지',
        home: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Text('~님', style: TextStyle(fontSize: 25.0)),
                GestureDetector(
                  child: Text('현황', style: TextStyle(fontSize: 15.0)),
                )
              ],
            ),
            elevation: 0.0,
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.circle, size: 20.0),
                      Text('센터 등록일: 2021.05.03~2021.08.03 ',
                          style: TextStyle(fontSize: 18.0)),
                      Text('결제금액: 15만원', style: TextStyle(fontSize: 18.0)),
                    ]),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.circle, size: 20.0),
                Text('센터 등록일: 2021.02.02~2021.05.02 ',
                    style: TextStyle(fontSize: 18.0)),
                Text('결제금액: 15만원', style: TextStyle(fontSize: 18.0))
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.circle, size: 20.0),
                Text('센터 등록일: 2021.11.01~2021.02.01 ',
                    style: TextStyle(fontSize: 18.0)),
                Text('결제금액: 15만원', style: TextStyle(fontSize: 18.0))
              ])
            ]),
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
                icon: Icon(Icons.alarm),
                title: Text('알림'),
              ),
            ],
          ),
        ));
  }
}
