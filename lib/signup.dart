import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  static final double _cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_cornerRadius),
     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              SizedBox(
                height: 200,
              ),
              _buildTextFormField("아이디", _emailController),
              SizedBox(
                height: 8,
              ),
              _buildTextFormField("비밀번호", _passwordController),
              SizedBox(
                height: 8,
              ),
              _buildTextFormField("비밀번호 확인", _confirmpasswordController),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 50,
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
                  child: Text("로그인", style: TextStyle(color: Colors.white)),
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
      cursorColor: Colors.white,
      controller: controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "입력창이 비었습니다.";
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: hintText,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
