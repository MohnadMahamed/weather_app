import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/big_text.dart';
import 'package:weather_app/widget/small_text.dart';
import 'package:intl/intl.dart';

class SliverTitle extends StatelessWidget {
  const SliverTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (titleController) {
      return titleController.isloaded
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius20),
                      bottomRight: Radius.circular(Dimensions.radius20)),
                  image: DecorationImage(
                    image: const AssetImage('assets/light.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black26.withOpacity(0.4),
                      BlendMode.darken,
                    ), // ColorFilter.mode
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  //locatio name
                  Row(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: BigText(
                            text: (titleController.currentWeather.name)
                                .toString(),
                          )),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(
                        text:
                            // "${(titleController.currentWeather.main!.temp!).toString()}",
                            '${(titleController.currentWeather.main!.temp! - 273.15).round().toString()}\u2103',
                        size: Dimensions.font20 * 1.5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Max and Min temperture
                          Row(
                            children: [
                              SmallText(
                                  text:
                                      '${(titleController.currentWeather.main!.tempMax! - 273.15).round().toString()}\u2103'),
                              const SmallText(text: ' / '),
                              SmallText(
                                  text:
                                      '${(titleController.currentWeather.main!.tempMin! - 273.15).round().toString()}\u2103'),
                            ],
                          ),
                          // Day and Time for now
                          Row(
                            children: [
                              SmallText(
                                text:
                                    DateFormat().add_E().format(DateTime.now()),
                              ),
                              const SmallText(text: ' , '),
                              SmallText(
                                text: DateFormat()
                                    .add_jm()
                                    .format(DateTime.now()),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20 * 3,
                        width: Dimensions.width20 * 2.5,
                        child: Lottie.asset('assets/json/suncloud.json'),
                      ),
                    ],
                  ),
                ],
              ))
          : myIndicator();
    });
  }
}
