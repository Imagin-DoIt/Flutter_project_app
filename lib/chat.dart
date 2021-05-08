import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Chats", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.add, color: Colors.black,),
                            SizedBox(width: 2,),
                            Text("New", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search.....",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100
                    )
                  )
                ),
              ),
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Text("");
              },
            )
          ],
        ),
      )
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Chats"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
            onPressed: (){},
        ),
      ],
    );
  }

}
