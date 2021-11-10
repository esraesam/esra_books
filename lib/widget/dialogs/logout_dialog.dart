import 'package:esra_books/authentication/login_screen.dart';
import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDIalog extends StatefulWidget {
  const LogoutDIalog({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required TextEditingController textFieldController,
  })  : _textFieldController = textFieldController,
        super(key: key);

  final double? screenHeight;
  final double? screenWidth;
  final TextEditingController _textFieldController;

  @override
  State<LogoutDIalog> createState() => _LogoutDIalogState();
}

class _LogoutDIalogState extends State<LogoutDIalog> {
  String email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
    print(email);
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(
          selectedColor: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Container(
      height: screenHeight * 0.07,
      width: screenWidth * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: new Text(
                  'Cancel',
                  style: TextStyle(
                      fontFamily: 'RopaSans',
                      color: kPrimaryColor,
                      fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text(
                  'Ok',
                  style: TextStyle(
                      fontFamily: 'RopaSans',
                      color: kPrimaryColor,
                      fontSize: 20),
                ),
                onPressed: () {
                  logOut(context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
