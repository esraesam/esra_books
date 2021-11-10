import 'package:esra_books/common/constants.dart';
import 'package:flutter/material.dart';

class CategorySearchBar extends StatelessWidget {
  const CategorySearchBar({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required TextEditingController textController,
  })  : _textController = textController,
        super(key: key);

  final double? screenWidth;
  final double? screenHeight;
  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth! * 0.8,
      height: screenHeight! * 0.08,
      child: TextField(
        controller: _textController,
        onChanged: (value) {},
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
                  onPressed: () {},
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
    );
  }
}
