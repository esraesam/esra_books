import 'package:esra_books/widget/loginWdg.dart';
import 'package:esra_books/widget/sign_up_wdg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    required this.selectedColor,
  }) : super(key: key);

  final Color selectedColor;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Widget> screens = [LoginUi(), SignUpUi()];
  int currentState = 0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // color: Colors.blue,
              height: 17.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleSwitch(
                    minWidth: 120.w,
                    minHeight: 40.h,
                    cornerRadius: 30.0,
                    fontSize: 17.sp,
                    activeBgColors: [
                      [Color(0xff74A9D1)],
                      [Color(0xff74A9D1)]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey[200],
                    inactiveFgColor: Color(0xff74A9D1),
                    initialLabelIndex: currentState,
                    totalSwitches: 2,
                    labels: ['Login', 'Sign Up'],
                    radiusStyle: true,
                    onToggle: (index) {
                      setState(() {
                        currentState = index;
                      });
                    }),
              ],
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: ListView(
                children: [
                  Image.asset(
                    'images/RectangleImg.png',
                    height: 200.h,
                    width: 200.w,
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: Text(
                      'Esra Books',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Container(
                      //color: Colors.red,
                      width: 330.w,
                      height: 400.h,
                      child: screens[currentState],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
