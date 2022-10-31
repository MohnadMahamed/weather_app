import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/controllers/home_controllers.dart';
import 'package:weather_app/model/five_day_weather_model.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/styles/dimensions.dart';

class ForecastChart extends StatelessWidget {
  const ForecastChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (chartController) {
      return chartController.isloaded
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              padding: EdgeInsets.all(Dimensions.width10),
              height: Dimensions.height20 * 8,
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
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Forecast Next 5 Days'),
                series: <ChartSeries<FiveDayWeather, String>>[
                  SplineSeries<FiveDayWeather, String>(
                    dataSource: chartController.fiveDaysData,
                    xValueMapper: (FiveDayWeather f, _) => f.dateTime,
                    yValueMapper: (FiveDayWeather f, _) => f.temp,
                  ),
                ],
              ),
            )
          : myIndicator();
    });
  }
}
