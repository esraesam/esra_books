import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutDIalog extends StatelessWidget {
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
