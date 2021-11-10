import 'dart:convert';
import 'dart:io';
import 'package:esra_books/common/constants.dart';
import 'package:http/http.dart' as http;

import 'package:esra_books/model/dark_themePro.dart';
import 'package:esra_books/screens/setting_screen.dart';
import 'package:esra_books/widget/dialogs/logout_dialog.dart';
import 'package:esra_books/widget/profile/profile_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  var name = '';

  Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('email')!;
    });

    print(name);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    //final themeChange = Provider.of<DarkThemeProvider>(context);
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),

                  LiteRollingSwitch(
                    value: true,
                    textOn: "Light",
                    textOff: "Dark",
                    colorOn: Colors.yellow[600],
                    colorOff: Colors.black,
                    iconOn: Icons.light_mode,
                    iconOff: Icons.dark_mode,
                    textSize: 19,
                    onChanged: (bool value) {
                      //themeChange.darkTheme = value;
                    },
                  ),

                  // Checkbox(
                  //     value: themeChange.darkTheme,
                  //     onChanged: (bool? value) {
                  //       themeChange.darkTheme = value!;
                  //     }),
                  // IconButton(
                  //     icon: Icon(MyAfpp.themeNotifier.value == ThemeMode.light
                  //         ? Icons.dark_mode
                  //         : Icons.light_mode),
                  //     onPressed: () {
                  //       MyApp.themeNotifier.value =
                  //           MyApp.themeNotifier.value == ThemeMode.light
                  //               ? ThemeMode.dark
                  //               : ThemeMode.light;
                  //     })
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   height: screenHeight * 0.2,
            //   width: screenWidth * 0.5,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //         image: ExactAssetImage('images/Esra.jpg'),
            //       )),
            // ),
            SizedBox(height: screenHeight * 0.01),

            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "esraesam919@gmail.com",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.04),
            ProfileItem(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              icon: Icons.lock,
              title: 'Privacy',
              onTap: () {},
            ),
            SizedBox(height: screenHeight * 0.05),
            ProfileItem(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              icon: Icons.notifications,
              title: 'Notification',
              onTap: () {},
            ),
            SizedBox(height: screenHeight * 0.05),
            ProfileItem(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingScreen(
                            index: 2,
                            list: [],
                          )),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.05),
            ProfileItem(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              icon: Icons.power_settings_new,
              title: 'LogOut',
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
                          'Are you sure logout?',
                          style: TextStyle(
                              fontFamily: 'RopaSans',
                              color: Colors.black,
                              fontSize: 22),
                        ),
                        content: LogoutDIalog(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            textFieldController: _textFieldController),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFile == null
                ? AssetImage("images/Esra.jpg") as ImageProvider
                : FileImage(File(_imageFile!.path))),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: kPrimaryColor,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }
}
