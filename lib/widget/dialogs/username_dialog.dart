import 'dart:convert';

import 'package:esra_books/screens/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:esra_books/common/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class name extends StatefulWidget {
  final List list;
  final int index;
  name({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.list,
    required this.index,
  });

  final double? screenHeight;
  final double? screenWidth;

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  TextEditingController user = TextEditingController();

  bool editMode = false;
  addUpdateData() {
    if (editMode) {
      var url = "http://192.168.1.10/bookDb/bookphp/edit.php";
      http.post(Uri.parse(url), body: {
        'id': widget.list[widget.index]['id'],
        'username': user.text,
      });
    } else {
      var url = "http://192.168.1.10/bookDb/bookphp/add.php";
      http.post(Uri.parse(url), body: {
        'username': user.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      user.text = widget.list[widget.index]['username'];
    }
  }

  // Future update() async {
  //   var url = "http://192.168.1.22/bookDb/bookphp/update.php";
  //   var response = await http.post(Uri.parse(url), body: {
  //     // "id": id,
  //     "username": user.text,
  //     //"password": pass.text,
  //   });
  //   //   print(user.text);
  //   // var data = jsonDecode(response.body);
  //   // if (data == "Error") {
  //   //   Fluttertoast.showToast(
  //   //       msg: "User allready exit!",
  //   //       toastLength: Toast.LENGTH_SHORT,
  //   //       gravity: ToastGravity.CENTER,
  //   //       timeInSecForIosWeb: 1,
  //   //       backgroundColor: Colors.red,
  //   //       textColor: Colors.white,
  //   //       fontSize: 16.0);
  //   // } else {
  //   //   Fluttertoast.showToast(
  //   //       msg: "Registration Successful",
  //   //       toastLength: Toast.LENGTH_SHORT,
  //   //       gravity: ToastGravity.CENTER,
  //   //       timeInSecForIosWeb: 1,
  //   //       backgroundColor: Colors.red,
  //   //       textColor: Colors.white,
  //   //       fontSize: 16.0);
  //   // }
  // }

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
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            controller: user,
            onChanged: (String value) {
              // setState(() {
              //   title = value;
              // });
            },
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.name,
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
                  setState(() {
                    addUpdateData();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                  debugPrint('Clicked RaisedButton Button');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
