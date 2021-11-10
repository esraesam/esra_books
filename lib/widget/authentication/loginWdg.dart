import 'dart:convert';
import 'package:esra_books/authentication/home_screen.dart';
import 'package:esra_books/authentication/login_screen.dart';
import 'package:esra_books/model/welcome.dart';
import 'package:esra_books/navigation/home_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({
    Key? key,
  }) : super(key: key);

  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  String email = "esraesam919@gmail.com";
  String password = "esra123";

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = "http://192.168.1.10/bookDb/bookphp/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', user.text);
    print(user.text);

    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeNav(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Username and Password invalid",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  List<Widget> screens = [
    LoginScreen(
      selectedColor: Colors.white,
    )
  ];
  int currentState = 0;
  final nameController = TextEditingController();
  bool _validate = false;
  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFFDAE6F0),
        ),
        width: 300,
        height: 500,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff74A9D1)),
                    ),
                    // hintText: "Enter your email",
                    labelText: "Username",
                    labelStyle: new TextStyle(color: Colors.black12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: user,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: new TextFormField(
                  obscureText: _isObscure,
                  decoration: new InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff74A9D1)),
                    ),
                    // hintText: "Enter your email",
                    labelText: "Password",
                    labelStyle: new TextStyle(color: Colors.black12),
                  ),
                  validator: (val) =>
                      val!.length < 6 ? 'Please enter your password' : null,
                  onSaved: (val) => _password = val!,
                  controller: pass,
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff74A9D1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
