import 'package:flutter/material.dart';

class CenterList extends StatefulWidget {
  CenterList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  CenterListState createState() => CenterListState();
}

class CenterListState extends State<CenterList> {
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '센터 선택 페이지',
        home: Scaffold(
          appBar: AppBar(
            title: Text('센터', style: TextStyle(fontSize: 25.0)),
            elevation: 0.0,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Column(
              children: [
                RaisedButton(
                    child: Row(
                      children: [
                        Text('A센터'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => null));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Text('B센터'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => null));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Text('C센터'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => null));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Text('D센터'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => null));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Text('E센터'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => null));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
              ],
            ),
          ),
        ));
  }
}
