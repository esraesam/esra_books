import 'dart:ui';

import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  BookDetail({
    Key? key,
    this.title,
    this.author,
    this.price,
    this.image,
    this.serialNo,
    this.publisher,
    this.rank,
    this.description,
  }) : super(key: key);

  String? title;
  String? author;
  String? price;
  String? image;
  String? serialNo;
  String? publisher;
  int? rank;
  String? description;
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
                  image: new NetworkImage(
                    '${widget.image}',
                  ),
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
                  child: Image(
                    width: 200,
                    height: 200,
                    image: NetworkImage(
                      '${widget.image}',
                    ),
                  ),
                  // '${widget.image}',
                  // fit: BoxFit.fill,
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  '${widget.title}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.author}',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${widget.price}' + '\$',
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
                          width: screenWidth * 0.92,
                          decoration: BoxDecoration(
                            color: kPrimaryColorLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '${widget.serialNo}',
                                            style: TextStyle(
                                                fontSize: 12,
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
                                            '${widget.publisher}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Publisher',
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
                                            '${widget.rank}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Rank',
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
                          '${widget.description}',
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
