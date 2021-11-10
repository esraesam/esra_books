import 'package:esra_books/common/constants.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.txt,
  }) : super(key: key);

  final double? screenHeight;
  final double? screenWidth;
  final IconData? icon;
  final String? title;
  final Function()? onTap;
  final String? txt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 14, right: 14),
        height: screenHeight! * 0.06,
        width: screenWidth! * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColorLight,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: screenWidth! * 0.05,
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade400,
              ),
            ),
            Spacer(),
            Text(
              '$txt',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.navigate_next_rounded,
              color: kPrimaryColor,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }
}
