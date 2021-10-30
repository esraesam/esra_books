// import 'dart:convert';
import 'package:esra_books/authentication/home_screen.dart';
import 'package:esra_books/authentication/login_screen.dart';
import 'package:esra_books/model/dark_themePro.dart';
// import 'package:esra_books/model/myModel.dart';
import 'package:esra_books/widget/style.dart';
import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:thememode_selector/thememode_selector.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
// import 'package:http/browser_client.dart';

void main() {
  runApp(MyApp());
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
            home: HomeScreen(),
          );
        },
      ),
    );

    // ScreenUtilInit(
    //   builder: () => MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       appBarTheme:
    //           AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
    //       primarySwatch: Colors.blue,
    //       textTheme: GoogleFonts.nunitoTextTheme(
    //         Theme.of(context).textTheme,
    //       ),
    //     ),
    //     home: LoginScreen(
    //       selectedColor: Colors.white,
    //     ),
    //     debugShowCheckedModeBanner: false,
    //   ),
    //   designSize: const Size(375, 812),
    // );
    // home: test()
  }
}
