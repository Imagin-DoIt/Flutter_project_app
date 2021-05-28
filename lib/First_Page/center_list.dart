import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

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
        description: "소개글",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Text("소개", style: TextStyle(color: Colors.white)),
        pathImage: "assets/센터.jpeg",
        onCenterItemPress: () {},
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
        description: "소개글",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpeg",
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
        description: "소개글",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpeg",
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
        description: "소개글",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpeg",
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
        description: "소개글",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpeg",
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Color(0x33D02090),
      colorActiveDot: Color(0xffD02090),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,
    );
  }
}
