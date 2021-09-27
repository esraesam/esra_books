import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _BookLibraryState createState() => _BookLibraryState();
}

class _BookLibraryState extends State<SearchScreen> {
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
      //resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Catagories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
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
                  color: Colors.black,
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
                  hintText: "Titles, authors or topics",
                  hintStyle: TextStyle(
                    fontSize: 16,
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
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: screenWidth,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      spacing: 12,
                      runSpacing: 14,
                      children: [
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/otivation.png'),
                          hint: 'Motivation & Inspiration',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Psycology.png'),
                          hint: 'Psychology',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Science.png'),
                          hint: 'Science',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Health.png'),
                          hint: 'Health & Nutrition',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Art.png'),
                          hint: 'Arts',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Money.png'),
                          hint: 'Money & Investments',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/education.png'),
                          hint: 'Education',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Kids.png'),
                          hint: 'Kids',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Social.png'),
                          hint: 'Social',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/programming.png'),
                          hint: 'Programming',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Rlegion.png'),
                          hint: 'Religion',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/history.png'),
                          hint: 'history',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/engineering.png'),
                          hint: 'Engineering',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/sports.png'),
                          hint: 'Sports',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/Geography.png'),
                          hint: 'Geography',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/food.png'),
                          hint: 'Food',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/sweets.png'),
                          hint: 'Sweets',
                        ),
                        BookContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          img: Image.asset('images/truestory.png'),
                          hint: 'True Story',
                        ),
                      ],
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

class BookContainer extends StatelessWidget {
  const BookContainer({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    this.hint,
    this.img,
  }) : super(key: key);

  final double? screenHeight;
  final double? screenWidth;
  final String? hint;
  final Image? img;

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Container(
      height: screenHeight * 0.05,
      decoration: BoxDecoration(
        color: kPrimaryColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: screenWidth * 0.01,
          ),
          Center(child: img),
          SizedBox(
            width: screenWidth * 0.02,
          ),
          Center(
            child: Text(
              hint!,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.01,
          ),
        ],
      ),
    );
  }
}
