import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

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
        backgroundColor: Colors.white,
        title: "A 센터",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description: "소개글",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "B 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "소개글",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "C 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "소개글",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "D 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "소개글",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "E 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "소개글",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
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
      color: Colors.black87,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.black87,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.black87,
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
      colorDot: Colors.black12,
      colorActiveDot: Colors.black54,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.black,
    );
  }
}
