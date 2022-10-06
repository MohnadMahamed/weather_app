import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/small_text.dart';

class LocationsList extends GetView<HomeController> {
  const LocationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (locationsListController) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: Dimensions.height20 * 5,
          width: double.infinity,
          // flex: 1,
          child: ListView.separated(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    locationsListController.city =
                        locationsListController.dataList[index].name!;
                    locationsListController.updateWeather();
                  },
                  child: locationItem(
                      cityName: locationsListController.dataList[index].name!
                          .toString(),
                      degree:
                          '${(locationsListController.dataList[index].main!.temp! - 273.15).round().toString()}\u2103'),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.height10,
                  ),
              itemCount: locationsListController.dataList.length),
        ),
      );
    });
  }
}

Widget locationItem({required String cityName, required String degree}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(text: cityName, size: Dimensions.font20),
          Row(
            children: [
              Icon(
                Icons.wb_sunny,
                color: Colors.yellowAccent,
                size: Dimensions.font26,
              ),
              SmallText(
                text: ' ${degree}',
                size: Dimensions.font20,
              ),
            ],
          )
        ],
      ),
    );
