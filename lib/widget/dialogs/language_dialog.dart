import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog(
      {Key? key,
      required double screenHeight,
      required double screenWidth,
      required TextEditingController textFieldController})
      : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Container(
      height: screenHeight * 0.53,
      width: screenWidth * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: screenHeight * 0.01),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 1;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kurdish",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 2;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "French",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 2,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 3;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.black26),
                            child: Radio(
                              value: 3,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 4;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Arabic",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 4,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 5;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Germany",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 5,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 6;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Italian",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 6,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 7;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Spanish",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 7,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 8;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Persion",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 8,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 9;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Turkey",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 9,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 10;
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Arabic\\lebanon",
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),

                        // SizedBox(width: screenWidth * 0.41),
                        Transform.scale(
                          scale: 1.5,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.black26,
                            ),
                            child: Radio(
                              value: 10,
                              groupValue: val,
                              onChanged: (int? value) {
                                setState(() {
                                  val = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      child: new Text(
                        'Ok',
                        style: TextStyle(
                            fontFamily: 'RopaSans',
                            color: kPrimaryColor,
                            fontSize: 25),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
