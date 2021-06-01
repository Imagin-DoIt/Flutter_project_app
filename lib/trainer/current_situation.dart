import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calendar_model.dart';

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
            actions: [
              IconButton(
                  icon: Icon(Icons.add), onPressed: () => _create(context))
            ],
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

void _create(BuildContext context) {
  String _name = "";
  var content = TextField(
    style: GoogleFonts.montserrat(
        color: Color.fromRGBO(105, 105, 108, 1), fontSize: 16),
    autofocus: true,
    decoration: InputDecoration(
      labelStyle: GoogleFonts.montserrat(
          color: Color.fromRGBO(59, 57, 60, 1),
          fontSize: 18,
          fontWeight: FontWeight.normal),
      labelText: '현황기록',
    ),
    onChanged: (value) {
      _name = value;
    },
  );
  var btn = FlatButton(
    child: Text('Save',
        style: GoogleFonts.montserrat(
            color: Color.fromRGBO(59, 57, 60, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold)),
    onPressed: () => _addEvent(_name),
  );
  var cancelButton = FlatButton(
      child: Text('Cancel',
          style: GoogleFonts.montserrat(
              color: Color.fromRGBO(59, 57, 60, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold)),
      onPressed: () => Navigator.of(context).pop(false));
  showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                SizedBox(height: 16.0),
                Text("Add Event",
                    style: GoogleFonts.montserrat(
                        color: Color.fromRGBO(59, 57, 60, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Container(padding: EdgeInsets.all(20), child: content),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[btn, cancelButton]),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

void _addEvent(String event) async {}
