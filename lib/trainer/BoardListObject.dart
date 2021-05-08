import 'BoardItemObject.dart';

class BoardListObject{

  String title;
  List<BoardItemObject> items;

  BoardListObject({required this.title,required this.items}){
    if(this.title == null){
      this.title = "";
    }
    if(this.items == null){
      this.items = [];
    }
  }
}