import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:esra_books/navigation/home_nav.dart';
import 'package:esra_books/widget/loginWdg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpUi extends StatefulWidget {
  const SignUpUi({Key? key}) : super(key: key);

  @override
  _SignUpUiState createState() => _SignUpUiState();
}

class _SignUpUiState extends State<SignUpUi> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    var url = "http://192.168.1.10/bookDb/bookphp/register.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "User allready exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registration Successful",
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
    }
  }

  final _formKey = GlobalKey<FormState>();
  List<Widget> screens = [LoginUi(), SignUpUi()];
  int currentState = 0;
  bool _obscureText = true;

  String? _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _isObscure = true;
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
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff74A9D1)),
                    ),
                    // hintText: "Enter your email",
                    labelText: "Email",
                    labelStyle: new TextStyle(color: Colors.black12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 40),
              Container(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff74A9D1), //background color of button
                    //border width and color
                    // elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register();
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomeNav()),
                      // );
                      // setState(
                      //   () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => HomeNav()),
                      //     );
                      //   },
                      // );
                    }
                  },
                  child: Text(
                    'Sign Up',
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
