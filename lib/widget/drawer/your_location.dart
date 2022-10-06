import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
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
                          size: Dimensions.font26,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(
                          text: 'Your Location',
                          size: Dimensions.font20,
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
                              size: Dimensions.font26,
                            )),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height20,
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
                        SmallText(
                            text: locationController.currentLocaionWeather.name
                                .toString(),
                            size: Dimensions.font20),
                        Row(
                          children: [
                            Icon(
                              Icons.wb_sunny,
                              color: Colors.yellowAccent,
                              size: Dimensions.font26,
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
