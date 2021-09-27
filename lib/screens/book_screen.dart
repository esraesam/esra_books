import 'package:esra_books/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
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
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Book Library',
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
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 11, left: 11, right: 11),
                child: GridView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 14),
                  children: [
                    Image.asset("images/princess.png"),
                    Image.asset("images/stowAway.png"),
                    Image.asset("images/Esra.jpg"),
                    Image.asset("images/thinking.png"),
                    Image.asset("images/Esra.jpg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
