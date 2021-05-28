import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CenterList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CenterList extends StatefulWidget {
  CenterList({Key key}) : super(key: key);

  @override
  CenterListState createState() => new CenterListState();
}

// ------------------ Custom config ------------------
// class CenterListState extends State<CenterList> {
//  List<Slide> slides = [];
//
//  @override
//  void initState() {
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "A 센터",
//        styleTitle:
//            TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//        description: "Ye indulgence unreserved connection alteration appearance",
//        styleDescription:
//            TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//        pathImage: "assets/photo_museum.png",
//        colorBegin: Color(0xffFFFACD),
//        colorEnd: Color(0xffFF6347),
//        directionColorBegin: Alignment.topRight,
//        directionColorEnd: Alignment.bottomLeft,
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "B 센터",
//        styleTitle:
//            TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//        description: "Ye indulgence unreserved connection alteration appearance",
//        styleDescription:
//            TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//        pathImage: "assets/photo_museum.png",
//        colorBegin: Color(0xffFFFACD),
//        colorEnd: Color(0xffFF6347),
//        directionColorBegin: Alignment.topRight,
//        directionColorEnd: Alignment.bottomLeft,
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "C 센터",
//        styleTitle:
//            TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//        description: "Ye indulgence unreserved connection alteration appearance",
//        styleDescription:
//            TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//        pathImage: "assets/photo_museum.png",
//        colorBegin: Color(0xffFFFACD),
//        colorEnd: Color(0xffFF6347),
//        directionColorBegin: Alignment.topRight,
//        directionColorEnd: Alignment.bottomLeft,
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "D 센터",
//        styleTitle:
//            TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//        description: "Ye indulgence unreserved connection alteration appearance",
//        styleDescription:
//            TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//        pathImage: "assets/photo_museum.png",
//        colorBegin: Color(0xffFFFACD),
//        colorEnd: Color(0xffFF6347),
//        directionColorBegin: Alignment.topRight,
//        directionColorEnd: Alignment.bottomLeft,
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "E 센터",
//        styleTitle:
//            TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//        description: "Ye indulgence unreserved connection alteration appearance",
//        styleDescription:
//            TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//        pathImage: "assets/photo_museum.png",
//        colorBegin: Color(0xffFFFACD),
//        colorEnd: Color(0xffFF6347),
//        directionColorBegin: Alignment.topRight,
//        directionColorEnd: Alignment.bottomLeft,
//      ),
//    );
//
//  void onDonePress() {
//    // Do what you want
//    // Navigator.push(
//    //   context,
//    //   MaterialPageRoute(builder: (context) => HomeScreen()),
//    // );
//  }
//
//  Widget renderNextBtn() {
//    return Icon(
//      Icons.navigate_next,
//      color: Color(0xffD02090),
//      size: 35.0,
//    );
//  }
//
//  Widget renderDoneBtn() {
//    return Icon(
//      Icons.done,
//      color: Color(0xffD02090),
//    );
//  }
//
//  Widget renderSkipBtn() {
//    return Icon(
//      Icons.skip_next,
//      color: Color(0xffD02090),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new IntroSlider(
//      // List slides
//      slides: this.slides,
//
//      // Skip button
//      renderSkipBtn: this.renderSkipBtn(),
//      colorSkipBtn: Color(0x33000000),
//      highlightColorSkipBtn: Color(0xff000000),
//
//      // Next button
//      renderNextBtn: this.renderNextBtn(),
//
//      // Done button
//      renderDoneBtn: this.renderDoneBtn(),
//      onDonePress: this.onDonePress,
//      colorDoneBtn: Color(0x33000000),
//      highlightColorDoneBtn: Color(0xff000000),
//
//      // Dot indicator
//      colorDot: Color(0x33D02090),
//      colorActiveDot: Color(0xffD02090),
//      sizeDot: 13.0,
//
//      // Show or hide status bar
//      hideStatusBar: true,
//      backgroundColorAllSlides: Colors.grey,
//
//      // Scrollbar
//      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
//    );
//  }
// }

// ------------------ Custom your own tabs ------------------
class CenterListState extends State<CenterList> {
  List<Slide> slides = [];

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "A 센터",
        styleTitle: TextStyle(
          color: Color(0xff3da4ab),
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/photo_museum.png",
      ),
    );
    slides.add(
      new Slide(
        title: "B 센터",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/photo_museum.png",
      ),
    );
    slides.add(
      new Slide(
        title: "C 센터",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/photo_museum.png",
      ),
    );
    slides.add(
      new Slide(
        title: "E 센터",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/photo_museum.png",
      ),
    );
    slides.add(
      new Slide(
        title: "E 센터",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/photo_museum.png",
      ),
    );
  }
  

  void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Color(0xffffcc5c),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Color(0xffffcc5c),

      // Dot indicator
      colorDot: Color(0xffffcc5c),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Behavior
      scrollPhysics: BouncingScrollPhysics(),

      // Show or hide status bar
      hideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}

//------------------ Default config ------------------
// class IntroScreenState extends State<IntroScreen> {
//  List<Slide> slides = [];
//
//  @override
//  void initState() {
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "ERASER",
//        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//        pathImage: "images/photo_eraser.png",
//        backgroundColor: Color(0xfff5a623),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "PENCIL",
//        description: "Ye indulgence unreserved connection alteration appearance",
//        pathImage: "images/photo_pencil.png",
//        backgroundColor: Color(0xff203152),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "RULER",
//        description:
//        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//        pathImage: "images/photo_ruler.png",
//        backgroundColor: Color(0xff9932CC),
//      ),
//    );
//  }
//
//  void onDonePress() {
//    // Do what you want
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new IntroSlider(
//      slides: this.slides,
//      onDonePress: this.onDonePress,
//    );
//  }
// }
