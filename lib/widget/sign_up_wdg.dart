import 'package:esra_books/navigation/home_nav.dart';
import 'package:esra_books/widget/loginWdg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpUi extends StatefulWidget {
  const SignUpUi({Key? key}) : super(key: key);

  @override
  _SignUpUiState createState() => _SignUpUiState();
}

class _SignUpUiState extends State<SignUpUi> {
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
          borderRadius: BorderRadius.circular(30.r),
          color: Color(0xFFDAE6F0),
        ),
        width: 300.w,
        height: 500.h,
        margin:
            EdgeInsets.only(left: 20.r, right: 20.r, bottom: 20.r, top: 8.r),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                height: 40.h,
                width: 180.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff74A9D1), //background color of button
                    //border width and color
                    // elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30.r)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeNav()),
                      );
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
                    style: TextStyle(fontSize: 20.sp),
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
