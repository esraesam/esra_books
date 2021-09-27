import 'package:esra_books/common/constants.dart';
import 'package:esra_books/screens/book_detail.dart';
import 'package:esra_books/screens/book_detail1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = new TextEditingController();

  void _clearTextField() {
    // Clear everything in the text field
    _textController.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Esra Books',
                    style: GoogleFonts.notoSerif(
                        textStyle: TextStyle(fontSize: 24)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/esra.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "It's Reading\n",
                          style: GoogleFonts.notoSerif(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 38,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "time",
                          style: GoogleFonts.notoSerif(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 38,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/RectangleImg.png',
                    width: screenWidth * 0.3,
                    // height: screenHeight * 0.3,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.08,
              child: TextField(
                controller: _textController,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                ),
                decoration: InputDecoration(
                  fillColor: kPrimaryColorLight,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.search, color: kPrimaryColor),
                  suffixIcon: _textController.text.length == 0
                      ? null
                      : IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: _clearTextField,
                        ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                  children: [
                    Container(
                      child: TabBar(
                        physics: BouncingScrollPhysics(),
                        //isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: kPrimaryColor,
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Container(
                            width: screenWidth * 0.32,
                            child: Tab(text: 'All'),
                          ),
                          Container(
                            width: screenWidth * 0.32,
                            child: Tab(text: 'Newest'),
                          ),
                          Container(
                            width: screenWidth * 0.32,
                            child: Tab(text: 'Recommended'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookDetail()),
                                        );
                                      },
                                      child: Image.asset('images/story.png')),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookDetail1()),
                                        );
                                      },
                                      child:
                                          Image.asset('images/thinking.png')),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                            ],
                          ),
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                            ],
                          ),
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/story.png'),
                                  Image.asset('images/thinking.png'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
