import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weather_app/shared/styles/colors.dart';
import 'package:weather_app/view/drawer_screen.dart';
import 'package:weather_app/view/weather_screen.dart';

var searchController = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    log('current height is ${MediaQuery.of(context).size.height}');
    log('current width is ${MediaQuery.of(context).size.width}');
    return ZoomDrawer(
      menuScreen: DrawerScreen(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      mainScreen: const WeatherHomeScreen(),
      borderRadius: 50,
      showShadow: true,
      angle: -7.0,
      slideWidth: 300,
      drawerShadowsBackgroundColor: const Color.fromARGB(255, 66, 82, 199),
      menuBackgroundColor: drawerColor,
      mainScreenTapClose: true,
    );
  }

  // Widget currentScreen() {
  //   switch (currentIndex) {
  //     case 0:
  //       return const WeatherHomeScreen(
  //         title: "Home",
  //       );
  //     case 1:
  //       return const WeatherHomeScreen(
  //         title: "Inbox",
  //       );
  //     case 2:
  //       return const WeatherHomeScreen(
  //         title: "Sent",
  //       );
  //     case 3:
  //       return const WeatherHomeScreen(
  //         title: "Favorite",
  //       );
  //     case 4:
  //       return const WeatherHomeScreen(
  //         title: "Archive",
  //       );
  //     case 5:
  //       return const WeatherHomeScreen(
  //         title: "Spam",
  //       );
  //     default:
  //       return const WeatherHomeScreen();
  //   }
  // }

}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(
        Icons.menu_open,
        color: Colors.white,
      ),
    );
  }
}
