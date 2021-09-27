import 'dart:ui';

import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.5,
              width: screenWidth,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/story.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: screenWidth * 0.1),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                      ),
                      SizedBox(width: screenWidth * 0.11),
                      Text(
                        'Book Detail',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  height: screenHeight * 0.28,
                  width: screenWidth * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'images/story.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'Let The Story Do The Work',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'by Esther Choy',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '20\$',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: screenHeight * 0.4,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.025),
                      Center(
                        child: Container(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.85,
                          decoration: BoxDecoration(
                            color: kPrimaryColorLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '09111',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Serial No.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                width: 50,
                                thickness: 2,
                                color: Colors.black38,
                                indent: 5,
                                endIndent: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Eng',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Language',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                width: 50,
                                thickness: 2,
                                color: Colors.black38,
                                indent: 5,
                                endIndent: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '300',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Number of\npages',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Text(
                          'Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        indent: 10,
                        endIndent: screenWidth * 0.7,
                        color: kPrimaryColor,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Text(
                          'People forget facts, but they never forget a good story. Unfortunately it’s never that simple, though. Because for most, there’s nothing easy about crafting a memorable story, let alone linking it to professional goals.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryColor),
                          ),
                          onPressed: () {},
                          child: Text("Read this book"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
