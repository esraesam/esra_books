// import 'dart:convert';
import 'package:esra_books/screens/home_screen.dart';
import 'package:esra_books/authentication/login_screen.dart';
import 'package:esra_books/model/dark_themePro.dart';
import 'package:esra_books/navigation/home_nav.dart';
import 'package:esra_books/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:esra_books/model/myModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  var image = preferences.getString('image');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null
        ? LoginScreen(
            selectedColor: Colors.white,
          )
        : HomeNav(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            // home: email == null
            //     ? LoginScreen(
            //         selectedColor: Colors.white,
            //       )
            //     : HomeScreen(),
          );
        },
      ),
    );
  }
}
