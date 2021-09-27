import 'package:esra_books/main.dart';
import 'package:esra_books/screens/setting_screen.dart';
import 'package:esra_books/widget/profile_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
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
            Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage('images/Esra.jpg'),
                  )),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Esra Esam',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'esraesm919@gmail.com',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.05),
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
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.05),
            ProfileItem(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              icon: Icons.power_settings_new,
              title: 'LogOut',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}