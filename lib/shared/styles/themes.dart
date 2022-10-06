import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/shared/styles/colors.dart';

abstract class MyThemes {
  static final ligthTheme = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      // titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      // titleTextStyle: TextStyle(
      //     fontFamily: 'jannah',
      //     color: Colors.black,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 30.0),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: 'jannah',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontFamily: 'jannah',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.3,
      ),
    ),
    fontFamily: 'jannah',
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    primarySwatch: defaultColor,
    // appBarTheme: AppBarTheme(
    //   // titleSpacing: 20.0,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarColor: HexColor('333739'),
    //     statusBarIconBrightness: Brightness.light,
    //   ),
    //   backgroundColor: HexColor('333739'),
    //   elevation: 0.0,
    //   titleTextStyle: const TextStyle(
    //       fontFamily: 'jannah',
    //       color: Colors.white,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 30.0),
    //   iconTheme: const IconThemeData(
    //     color: Colors.white,
    //   ),
    // ),

    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 30,
        fontFamily: 'jannah',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontSize: 20,
        fontFamily: 'jannah',
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1.3,
      ),
    ),
    fontFamily: 'jannah',
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: HexColor('333739'),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: HexColor('333739'),
    ),
  );
}
