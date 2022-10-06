import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/helper/cash_helper.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/drawer/locations_list.dart';
import 'package:weather_app/widget/small_text.dart';

var searchController = TextEditingController();

class OtherLocations extends StatelessWidget {
  const OtherLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.add_location_outlined,
              color: Colors.white,
              size: Dimensions.font26,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(
              text: 'Other Locations',
              size: Dimensions.font20,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const LocationsList(),
        // const OtherLocations(),
        // SizedBox(
        //   height: Dimensions.height20,
        // ),
        GetBuilder<HomeController>(builder: (controller) {
          return defaultTextFormFeild(
            controller: searchController,
            hintText: 'Add Location',
            suffix: Icons.manage_search,
            onChanged: (value) => controller.city = value,
            onTap: (value) {
              controller.updateWeather();
              showToast(
                  text: 'Location added Successfully',
                  state: ToastStates.success);
              // CacheHelper.saveData(key: 'updateList', value: controller.locations.add(value));

              // CacheHelper.getData(key: 'dataList');

              //  List<CurrentWeather> updateList = [];

              // searchController.text = '';
            },
          );
        })
      ],
    );
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
