import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/helper/dependancies.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/view/home_screen.dart';
import 'package:weather_app/view/splach_screen.dart';
import 'shared/styles/themes.dart';
// import 'helper/dependancies.dart' as dep;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // // await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.find<HomeController>().getCurrentWeatherData();
    // final size = MediaQuery.of(context).size;
    // // log(size.toString());
    // double screenWidth = Dimensions.screenWidth;
    // log(screenWidth.toString());
    // static double screenHeight = Get.context!.height;

    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyThemes.ligthTheme,
      darkTheme: MyThemes.darkTheme,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
