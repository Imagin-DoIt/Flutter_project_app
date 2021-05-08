import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/trainer/trainer_main.dart';
import 'login.dart';
import 'signup.dart';
import 'reserve.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: AuthTypeSelector(),
      ),
    );
  }
}

class AuthTypeSelector extends StatelessWidget {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 300.0, 0, 0),
          child: Column(
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text('로그인', style: TextStyle(fontSize: 18)),
                onPressed: () => _pushPage(context, LoginPage()),
                textColor: Colors.black,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text('관리자', style: TextStyle(fontSize: 18)),
                onPressed: () => _pushPage(context, TrainerMainPage()),
                textColor: Colors.black,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text('회원', style: TextStyle(fontSize: 18)),
                onPressed: () => _pushPage(context, HomePage()),
                textColor: Colors.black,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 30.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text('회원가입', style: TextStyle(fontSize: 18)),
                      onPressed: () => _pushPage(context, SignupPage()),
                      textColor: Colors.black,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 120.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text('방문/상담', style: TextStyle(fontSize: 18)),
                      onPressed: () => _pushPage(context, ReservePage()),
                      textColor: Colors.black,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
