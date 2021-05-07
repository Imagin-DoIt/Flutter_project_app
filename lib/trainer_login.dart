import 'package:flutter/material.dart';
import 'trainer_main.dart';
import 'dart:io';

class Trainer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '관리자 로그인',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('관리자 로그인'),
            ),
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 45.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    initialValue: '',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    initialValue: '',
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('로그인'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Trainermain()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
