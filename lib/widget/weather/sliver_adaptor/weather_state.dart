import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/small_text.dart';

class WeatherState extends GetView<HomeController> {
  const WeatherState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (weatherState) {
      return weatherState.isloaded
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              padding: EdgeInsets.all(Dimensions.width10),
              height: Dimensions.font20 * 10,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white.withOpacity(.8)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.height20 * 5,
                          width: Dimensions.width20 * 5,
                          child: Lottie.asset('assets/json/press.json'),
                        ),
                        const SmallText(
                          text: 'Pressure',
                          color: Colors.black87,
                        ),
                        SmallText(
                          text:
                              '${weatherState.currentWeather.main!.pressure!} hPa',
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: Dimensions.height10),
                      height: double.infinity,
                      width: 2.0,
                      color: Colors.black26,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.height20 * 5,
                          width: Dimensions.width20 * 5,
                          child: Lottie.asset('assets/json/wind.json'),
                        ),
                        const SmallText(
                          text: 'Wind',
                          color: Colors.black87,
                        ),
                        SmallText(
                          text:
                              '${((weatherState.currentWeather.wind!.speed!) * 3.6).round()} Km/h',
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: Dimensions.height10),
                      height: double.infinity,
                      width: 2.0,
                      color: Colors.black26,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.height20 * 5,
                          width: Dimensions.width20 * 5,
                          child: Lottie.asset('assets/json/humidity.json'),
                        ),
                        const SmallText(
                          text: 'Humidity',
                          color: Colors.black87,
                        ),
                        SmallText(
                          text:
                              '${weatherState.currentWeather.main!.humidity!} %',
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : myIndicator();
    });
  }
}
