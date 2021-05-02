import 'package:flutter/material.dart';

class ReservePage extends StatefulWidget {
  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _dayController = TextEditingController();

  static final double _cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _reserveFormWidget(),
      ),
    );
  }

  Widget _reserveFormWidget() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              _buildTextFormField("아이디", _emailController),
              SizedBox(
                height: 8,
              ),
              _buildTextFormField("비밀번호", _passwordController),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(
                  children: <Widget>[
                    Expanded(child: _buildTextFormField("생년", _yearController)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _buildTextFormField("월", _monthController)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _buildTextFormField("일", _dayController)),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: _buildTextFormField("방문 월", _monthController)),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: _buildTextFormField("방문 일", _dayController)),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("입력값이 맞다");
                    }
                  },
                  color: Colors.black26,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_cornerRadius)),
                  padding: EdgeInsets.all(16),
                  child: Text("예약", style: TextStyle(color: Colors.white)),
                ),
              ),
              Divider(
                height: 40,
                thickness: 1,
                color: Colors.black,
                indent: 14,
                endIndent: 14,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  buildButton('assets/google.jpeg', () {}),
                  buildButton('assets/facebook.png', () {}),
                  buildButton('assets/kakao.jpeg', () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildButton(String imagePath, Function onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white10),
      child: IconButton(
        onPressed: () {},
        icon: ImageIcon(AssetImage(imagePath)),
      ),
    );
  }

  TextFormField _buildTextFormField(
      String hintText, TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "입력창이 비었습니다.";
        }
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: hintText,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
