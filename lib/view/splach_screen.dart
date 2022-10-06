import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/view/home_screen.dart';
import 'package:weather_app/widget/big_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff04352d),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/moring.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.expandedHeight / 2),
              child: Align(
                alignment: Alignment.topCenter,
                child: BigText(
                  text: 'Weather Application',
                  size: Dimensions.font30,
                ),
              ),
            ),
            Positioned(
              bottom: Dimensions.height10,
              left: Dimensions.width10 / 5,
              right: Dimensions.width10 / 5,
              child: Column(
                children: [
                  myIndicator(),
                  SizedBox(
                    height: Dimensions.height10 / 5,
                  ),
                  BigText(
                    text: 'Created By Mohnad Mahamed',
                    size: Dimensions.font20,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
