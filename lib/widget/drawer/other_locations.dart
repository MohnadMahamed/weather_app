import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/big_text.dart';
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
              size: Dimensions.iconSize24,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            BigText(
              text: 'Other Locations',
              size: Dimensions.font16 + 2,
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
          SizedBox(
              width: Dimensions.width20,
              child: SmallText(text: cityName, size: Dimensions.font16 + 2)),
          Row(
            children: [
              Icon(
                Icons.wb_sunny,
                color: Colors.yellowAccent,
                size: Dimensions.iconSize24,
              ),
              SmallText(
                text: ' $degree',
                size: Dimensions.font20,
              ),
            ],
          )
        ],
      ),
    );
