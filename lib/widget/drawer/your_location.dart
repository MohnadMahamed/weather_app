import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/big_text.dart';
import 'package:weather_app/widget/small_text.dart';

class YourLocation extends GetView<HomeController> {
  const YourLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (locationController) {
      return locationController.isloaded
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(
                          text: 'Your Location',
                          size: Dimensions.font16 + 3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showToast(
                                  text: 'Your Locattion updated successfully',
                                  state: ToastStates.success);

                              // changeLocation();
                            },
                            icon: Icon(
                              Icons.gps_fixed_rounded,
                              color: Colors.white,
                              size: Dimensions.iconSize24,
                            )),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                InkWell(
                  onTap: () {
                    // locationController.lat = 31.0409;
                    // locationController.lon = 31.3785;

                    locationController.city = 'Al Mansura';
                    locationController.updateWeather();
                    // locationController.getCurrenLocationtWeatherData(lat:lat,lon:long)
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Dimensions.font20 * 4,
                          child: SmallText(
                            text: locationController.currentLocaionWeather.name
                                .toString(),
                            size: Dimensions.font16 + 2,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.wb_sunny,
                              color: Colors.yellowAccent,
                              size: Dimensions.iconSize24,
                            ),
                            SmallText(
                              text:
                                  '${(locationController.currentLocaionWeather.main!.temp! - 273.15).round().toString()}\u2103',
                              size: Dimensions.font20,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // defaultButton(
                //     // controller: searchController,
                //     text: 'Update Location',
                //     suffix: Icons.gps_fixed),
              ],
            )
          : myIndicator();
    });
  }
}
