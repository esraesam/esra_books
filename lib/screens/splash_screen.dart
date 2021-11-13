import 'dart:async';
import 'package:esra_books/authentication/login_screen.dart';
import 'package:esra_books/navigation/home_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => checkUser());
    super.initState();
  }

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = preferences.getString('email');
    var image = preferences.getString('image');

    if (email == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => LoginScreen(selectedColor: Colors.black)));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeNav()));
    }
    // email == null
    //     ? LoginScreen(
    //         selectedColor: Colors.white,
    //       )
    //     : HomeNav();
  }

// Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => LoginScreen(selectedColor: Colors.white),
//         ),
//       ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ))
              ],
            ),
          ),
        ));
  }
}
