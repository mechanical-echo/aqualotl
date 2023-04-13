// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print

import 'package:aqualotl/firebase_options.dart';
import 'package:aqualotl/pages/HomePage/homepage.dart';
import 'package:aqualotl/pages/temp/profilepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../constants/colors.dart';
import '../pages/authentication/signup/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      theme: ThemeData(
        // brightness: Brightness.light,
        primaryColor: lBgColor,
        fontFamily: 'TiltWarp',
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                textStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 17,
                    fontFamily: 'TiltWarp',
                    fontWeight: FontWeight.w300))),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          textStyle: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: 'TiltWarp',
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.grey.shade200,
          elevation: 2,
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: lSubTextColor,
                textStyle: TextStyle(
                    fontSize: 17,
                    fontFamily: 'TiltWarp',
                    fontWeight: FontWeight.w300))),
        textTheme: TextTheme(
            displayLarge: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w500, color: lAccentColor),
            displayMedium: TextStyle(fontSize: 27, color: lSubTextColor),
            bodySmall: TextStyle(
                fontSize: 20,
                color: lSubTextColor,
                fontWeight: FontWeight.w300),
            labelSmall: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500)),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Auth(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
