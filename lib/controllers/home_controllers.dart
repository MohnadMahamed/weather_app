import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/Data/services/weather_services.dart';
import 'package:weather_app/helper/cash_helper.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/model/five_day_weather_model.dart';
// import '/model/current_weather_data.dart';
// import '/model/five_days_data.dart';
// import '/service/weather_service.dart';

class HomeController extends GetxController {
  String? city;
  double? lat;
  double? lon;
  String? searchText;

  bool _isLoaded = false;
  bool get isloaded => _isLoaded;
  CurrentWeather currentWeather = CurrentWeather();
  CurrentWeather currentLocaionWeather = CurrentWeather();
  List<CurrentWeather> dataList = [];
  List<FiveDayWeather> fiveDaysData = [];

  HomeController({required this.city, required this.lat, required this.lon});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    // getCurrentWeatherData();
    // getCurrenLocationtWeatherData();

    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
    getCurrenLocationtWeatherData();
  }

  // int savePage3 = 1;
  // List<String> list;
  // void changeSavePage3(String fromShared) {
  //   list = list.add('$fromShared');
  //   CacheHelper.saveData(key: 'savePage3', value: list);
  // }

  void getCurrentWeatherData() {
    WeatherServices(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeather = data;
          _isLoaded = true;
          update();
        },
        onError: (error) => {
              log(error.toString()),
              update(),
            });
  }

  void getCurrenLocationtWeatherData() {
    WeatherServices(lat: lat, lon: lon).getCurrentLocationWeatherData(
        onSuccess: (data) {
          currentLocaionWeather = data;
          _isLoaded = true;
          update();
        },
        onError: (error) => {
              log(error.toString()),
              update(),
            });
  }

  void getTopFiveCities() {
    List<String> cities = [
      'Cairo',
      'Zagazig',
      'London',
      'Alexandria',
      'Paris',
      'Mit Ghamr'
    ];
    for (var c in cities) {
      WeatherServices(city: c).getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        log(error.toString());
        update();
      });
    }
  }

  void getFiveDaysData() {
    WeatherServices(city: '$city').getFiveForecastData(onSuccess: (data) {
      fiveDaysData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }
}
