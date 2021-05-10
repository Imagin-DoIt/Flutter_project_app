import 'package:flutter/material.dart';

class Newuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            RaisedButton(
              child: Text('가입하기'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
