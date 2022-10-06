import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';
import 'package:weather_app/widget/weather/sliver_adaptor/forecast_chart.dart';
import 'package:weather_app/widget/weather/sliver_adaptor/sun_state.dart';
import 'package:weather_app/widget/weather/sliver_adaptor/weather_state.dart';

class SliverAdapter extends StatefulWidget {
  const SliverAdapter({Key? key}) : super(key: key);

  @override
  State<SliverAdapter> createState() => _SliverAdapterState();
}

class _SliverAdapterState extends State<SliverAdapter> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        SizedBox(
          height: Dimensions.height30,
        ),
        //sunrise state
        GetBuilder<HomeController>(
            builder: (adapterController) =>
                adapterController.isloaded ? const SunState() : myIndicator()),

        SizedBox(
          height: Dimensions.height15,
        ),
        //wether state
        const WeatherState(),
        SizedBox(
          height: Dimensions.height15,
        ),
        //Forecast For Next 5 Days
        const ForecastChart(),
        SizedBox(
          height: Dimensions.height30,
        ),
      ],
    ));
  }
}
