import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  Email({
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
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Container(
      height: screenHeight * 0.25,
      width: screenWidth * 0.65,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            controller: _textFieldController,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.emailAddress,
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
          )
        ],
      ),
    );
  }
}
