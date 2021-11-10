import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.nunitoTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: isDarkTheme ? Colors.white : Colors.black,
            ),
      ),
      primarySwatch: isDarkTheme ? Colors.lightBlue : Colors.blue,
      primaryColor: isDarkTheme ? Color(0xff0E1D36) : Colors.white,
      backgroundColor: isDarkTheme ? Color(0xFF15294D) : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: isDarkTheme ? Colors.white : Colors.black,
        labelColor: isDarkTheme ? Colors.white : Colors.black,
      ),
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Color(0xff243447) : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: isDarkTheme ? Color(0xFF15294D) : Color(0xffF1F5FB),
        elevation: 0.0,
      ),
    );
  }
}
