import 'package:flutter/material.dart';
import 'package:project2/chat.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'chat.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.messenger_rounded),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ChatPage())
              ),
              ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(""),
              accountEmail: null,
                currentAccountPicture: CircleAvatar(
                    child: Text("")
                ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("스케쥴"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text("회원관리"),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: SfCalendar(
                view: CalendarView.week,
                firstDayOfWeek: 7,
                // initialDisplayDate: DateTime(2021, 5, 2, 09, 00),
                // initialSelectedDate: DateTime(2021, 5, 2, 09, 00),
              ),
            ),
          ),
        ],
      )
      ,
    );
  }
}


