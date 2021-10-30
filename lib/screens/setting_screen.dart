import 'package:esra_books/widget/Country_dialog.dart';
import 'package:esra_books/widget/email_dialog.dart';
import 'package:esra_books/widget/language_dialog.dart';
import 'package:esra_books/widget/password_dialog.dart';
import 'package:esra_books/widget/phone_dialog.dart';
import 'package:esra_books/widget/settings_item.dart';
import 'package:esra_books/widget/username_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Settings'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      SettingsItem(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.person,
                        title: 'Username',
                        txt: "Esra Esam",
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    'Enter your new name',
                                    style: TextStyle(
                                        fontFamily: 'RopaSans',
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                  content: name(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      textFieldController:
                                          _textFieldController),
                                );
                              });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SettingsItem(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.email,
                        title: 'Email',
                        txt: 'esraesam919@gmail.com',
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    'Enter new email',
                                    style: TextStyle(
                                        fontFamily: 'RopaSans',
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                  content: Email(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      textFieldController:
                                          _textFieldController),
                                );
                              });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SettingsItem(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.vpn_key,
                        title: 'Password',
                        txt: 'password',
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                title: Text(
                                  'Enter new Password',
                                  style: TextStyle(
                                      fontFamily: 'RopaSans',
                                      color: Colors.black,
                                      fontSize: 22),
                                ),
                                content: Password(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    textFieldController: _textFieldController),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SettingsItem(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.language,
                        title: 'Language',
                        txt: 'Kurdish',
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    'Select your language',
                                    style: TextStyle(
                                        fontFamily: 'RopaSans',
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                  content: LanguageDialog(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      textFieldController:
                                          _textFieldController),
                                );
                              });
                          // LanguageDialog();
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SettingsItem(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.phone,
                        title: 'Phone Number',
                        txt: 'phone number',
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    'Enter phone number',
                                    style: TextStyle(
                                        fontFamily: 'RopaSans',
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                  content: PhoneDialog(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      textFieldController:
                                          _textFieldController),
                                );
                              });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SettingsItem(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        icon: Icons.home,
                        title: 'Country/Region',
                        txt: 'Kurdistan Region',
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text(
                                    'Select your Country/Region',
                                    style: TextStyle(
                                        fontFamily: 'RopaSans',
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                  content: CountryDialog(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      textFieldController:
                                          _textFieldController),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
