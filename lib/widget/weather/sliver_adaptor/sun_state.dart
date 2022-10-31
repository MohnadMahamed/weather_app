import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/small_text.dart';
import 'package:intl/intl.dart';

class SunState extends GetView<HomeController> {
  const SunState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (sunController) {
        // var dateUtc = DateTime.fromMillisecondsSinceEpoch(
        //     sunController.currentWeather.sys!.sunrise!,
        //     isUtc: true);
        // var dateInMyTimezone = dateUtc.add(Duration(hours: 8));
        // var secondsOfDay = dateInMyTimezone.hour * 3600 +
        //     dateInMyTimezone.minute * 60 +
        //     dateInMyTimezone.second;
        // var date1 = sunrise.add(Duration(hours: 2));
        var sunrise = DateTime.fromMillisecondsSinceEpoch(
                (sunController.currentWeather.sys!.sunrise! * 1000))
            .toUtc()
            .add(const Duration(hours: 2));
        var sunset = DateTime.fromMillisecondsSinceEpoch(
                sunController.currentWeather.sys!.sunset! * 1000)
            .toUtc()
            .add(const Duration(hours: 2));
        return sunController.isloaded
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width30,
                    right: Dimensions.width30),
                height: Dimensions.height20 * 8,
                width: Dimensions.screenWidth,
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SmallText(
                              text: 'Sunrise',
                              color: Colors.black87,
                            ),
                            SmallText(
                              text: DateFormat('hh:mm a').format(sunrise),
                              color: Colors.black87,
                            ),
                            SizedBox(
                              height: Dimensions.height20 * 4,
                              width: Dimensions.width20 * 4,
                              child: Lottie.asset('assets/json/sunrise.json'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: Dimensions.width10),
                        height: double.infinity,
                        width: Dimensions.width10 / 5,
                        color: Colors.black26,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SmallText(
                              text: 'Sunset',
                              color: Colors.black87,
                            ),
                            SmallText(
                              text: DateFormat('hh:mm a').format(sunset),
                              color: Colors.black87,
                            ),
                            SizedBox(
                              height: Dimensions.height20 * 4,
                              width: Dimensions.width20 * 4,
                              child: Lottie.asset('assets/json/sunset.json'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
      },
    );
  }
}
