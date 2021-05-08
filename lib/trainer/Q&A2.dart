import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import '../main.dart';
import 'BoardItemObject.dart';
import 'BoardListObject.dart';
import 'Customer_list.dart';
import 'trainer_main.dart';

class QA extends StatefulWidget {


  @override
  QAState createState() => QAState();
}
class QAState extends State<QA> {
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  List<BoardListObject> _listData = [
    BoardListObject(title: "자주하는 Q&A", items: []),
    BoardListObject(title: "Q&A", items: []),
  ];

  //Can be used to animate to different sections of the BoardView
  BoardViewController boardViewController = new BoardViewController();

  @override
  Widget build(BuildContext context) {
    List<BoardList> _lists = [];
    for (int i = 0; i < _listData.length; i++) {
      _lists.add(_createBoardList(_listData[i]) as BoardList);
    }
    return MaterialApp(
      title: 'Q&A 페이지',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: MultiLevelDrawer(
            header: Container(
              child: Column(children: <Widget>[
                _createHeader(),
              ]),
            ),
            children: [
              MLMenuItem(
                leading: Icon(Icons.event),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "스케줄",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("일정")),
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                  }, submenuContent: Text("관리")),
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                  }, submenuContent: Text("신청현황")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "회원관리",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomerList()));
                      },
                      submenuContent:  Text("명단")),
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QA()));
                  }, submenuContent: Text("자주하는 Q&A")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "설정",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                      },
                      submenuContent: Text("식단")),
                  MLSubmenu(onClick: () {
                    Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TrainerMainPage()));
                  }, submenuContent: Text("운동")),
                ],
                onClick: () {},
              ),
              MLMenuItem(
                leading: Icon(Icons.exit_to_app),
                content: Text(
                  "로그아웃",
                ),
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ],
          ),
      appBar: AppBar(
        title: Column(
              children: [
                Text('~님', style: TextStyle(fontSize: 25.0)),
                GestureDetector(
                  child: Text('Q&A', style: TextStyle(fontSize: 15.0)),
                )
              ],
            ),
        elevation: 0.0
      ),
      body: BoardView(
      lists: _lists,
      boardViewController: boardViewController,
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
                title: Text('알림'),
                icon: Icon(Icons.notifications),
              ),
            ],
          ),
    ),);
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
        // onStartDragItem:
        //     (int listIndex, int itemIndex, BoardItemState state) {},
        // onDropItem: (int listIndex, int itemIndex, int oldListIndex,
        //     int oldItemIndex, BoardItemState state) {
        //   //Used to update our local item data
        //   var item = _listData[oldListIndex].items[oldItemIndex];
        //   _listData[oldListIndex].items.removeAt(oldItemIndex);
        //   _listData[listIndex].items.insert(itemIndex, item);
        // },
        // onTapItem:
        //     (int listIndex, int itemIndex, BoardItemState state) async {},
        item: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(itemObject.title),
          ),
        ));
  }

  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items.length; i++) {
      items.insert(i, buildBoardItem(list.items[i]) as BoardItem);
    }

    return BoardList(
      // onStartDragList: (int listIndex) {},
      // onTapList: (int listIndex) async {},
      // onDropList: (int listIndex, int oldListIndex) {
      //   //Update our local list data
      //   var list = _listData[oldListIndex];
      //   _listData.removeAt(oldListIndex);
      //   _listData.insert(listIndex, list);
      // },
      headerBackgroundColor: Color.fromARGB(255, 235, 236, 240),
      backgroundColor: Color.fromARGB(255, 235, 236, 240),
      header: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  list.title,
                  style: TextStyle(fontSize: 20),
                ))),
      ],
      items: items,
    );
  }
  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/con.png'),
        backgroundColor: Colors.white,
      ),
      accountName: Text('CONNIE'),
      accountEmail: Text('rladldud1109@naver.com'),
      onDetailsPressed: () {
        print('arrow is clicked');
      },
      decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0))),
    );
  }
}
