// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print

import 'package:aqualotl/pages/authentication/splashscreen.dart';
import 'package:aqualotl/pages/HomePage/homepage.dart';
import 'package:aqualotl/pages/temp/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'constants/colors.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override Widget build(BuildContext context){
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      theme: ThemeData(
       // brightness: Brightness.light,
        primaryColor: lBgColor,
        fontFamily: 'TiltWarp',
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            
            textStyle: TextStyle(color: Colors.blueAccent, fontSize: 17, fontFamily: 'TiltWarp', fontWeight: FontWeight.w300)

          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lSubTextColor,
            textStyle: TextStyle( fontSize: 17, fontFamily: 'TiltWarp', fontWeight: FontWeight.w300)
          )
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: lAccentColor),
          displayMedium: TextStyle(fontSize: 27, color: lSubTextColor),
          bodySmall: TextStyle(fontSize: 20, color: lSubTextColor, fontWeight: FontWeight.w300),
        ),
      ),
      /*
       * DARK THEME
      darkTheme: ThemeData(
        //brightness: Brightness.dark,
        primaryColor: dBgColor,        
        fontFamily: 'TiltWarp', 
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: dSecondaryColor,
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: dSecondaryColor
          )
        ),
        textTheme: TextTheme(
          
          displayLarge: TextStyle(fontSize: 55, fontWeight: FontWeight.w500, color: dAccentColor),
          displayMedium: TextStyle(fontSize: 30, color: Colors.white70),
        ),
      ),
      */
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/home',
      routes: {
        '/': (context) => HomePage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
  
}

class methods {
  void openPage(int i, BuildContext context){
  switch(i){
    case 0:
    print('bottles page');
    break;
    case 1:
    print('games page');
    break;
    case 2:
    print('home page');
    break;
    case 3:
    print('profile page');
    break;
    case 4:
    print('settings page');
    break;
  }
  switch(i){
    case 2: //home
      Navigator.pushNamed(context, '/home');
    break;
    case 3: //profile
      Navigator.pushNamed(context, '/profile');
    break;
  }
}
}