import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/big_text.dart';
import 'package:weather_app/widget/small_text.dart';
import 'package:intl/intl.dart';

class SliverBackground extends GetView<HomeController> {
  const SliverBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (backgroundController) {
      return backgroundController.isloaded
          ? Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius20 * 2),
                      bottomRight: Radius.circular(Dimensions.radius20 * 2)),
                  image: DecorationImage(
                    image: const AssetImage('assets/light.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black26.withOpacity(0.4),
                      BlendMode.darken,
                    ), // ColorFilter.mode
                  )),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Location tempreture Degree
                      BigText(
                        text:
                            '${(backgroundController.currentWeather.main!.temp! - 273.15).round().toString()}\u2103',
                        size: Dimensions.height10 * 5,
                      ),
                      SizedBox(
                        height: Dimensions.height20 * 5,
                        width: Dimensions.width20 * 5,
                        child: Lottie.asset('assets/json/suncloud.json'),
                      ),
                    ],
                  ),
                  //Location  Name
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        BigText(
                          text: (backgroundController.currentWeather.name)
                              .toString(),
                          size: Dimensions.font30 * 1.2,
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                          size: Dimensions.font26,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Max and Min temperture
                          Row(
                            children: [
                              SmallText(
                                  text:
                                      '${(backgroundController.currentWeather.main!.tempMax! - 273.15).round().toString()}\u2103'),
                              const SmallText(text: ' / '),
                              SmallText(
                                  text:
                                      '${(backgroundController.currentWeather.main!.tempMin! - 273.15).round().toString()}\u2103'),
                            ],
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          //Feel Like
                          SmallText(
                              text:
                                  'Feel like ${(backgroundController.currentWeather.main!.feelsLike! - 273.15).round().toString()}\u2103')
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height10 / 2,
                      ),
                      // Day and Time for now
                      Row(
                        children: [
                          SmallText(
                            text: DateFormat().add_E().format(DateTime.now()),
                          ),
                          const SmallText(text: ' , '),
                          SmallText(
                            text: DateFormat().add_jm().format(DateTime.now()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          : myIndicator();
    });
  }
}
