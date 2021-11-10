import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  Password({
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
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isObscure = true;

  late String _password;

  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Expanded(
      child: Container(
        height: screenHeight * 0.25,
        width: screenWidth * 0.65,
        child: Expanded(
          child: ListView(
            children: <Widget>[
              TextFormField(
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
              SizedBox(height: screenHeight * 0.08),
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
                      'Submit',
                      style: TextStyle(
                          fontFamily: 'RopaSans',
                          color: kPrimaryColor,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
