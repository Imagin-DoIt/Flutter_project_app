import 'package:flutter/material.dart';
import 'new_user.dart';
import 'Counseling.dart';
import 'trainer_login.dart';
import 'member_login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Login Basics',
    debugShowCheckedModeBanner: false,
    home: Mainscreen(),
  ));
}

class Mainscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('관리자'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Trainer()),
                    );
                  },
                ),
                RaisedButton(
                  child: Text('회원'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Member()),
                    );
                  },
                ),
                RaisedButton(
                  child: Text('센터 찾기'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Member()),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  child: Text('회원가입'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Newuser()),
                    );
                  },
                ),
                RaisedButton(
                  child: Text('방문상담'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Counseling()),
                    );
                  },
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
