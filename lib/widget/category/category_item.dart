import 'package:esra_books/common/constants.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    this.hint,
  }) : super(key: key);

  final double? screenHeight;
  final double? screenWidth;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: screenWidth! * 0.01,
          ),
          Expanded(
            child: Center(
              child: Text(
                hint!,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth! * 0.01,
          ),
        ],
      ),
    );
  }
}
