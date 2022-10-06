import 'dart:developer';

import 'package:weather_app/Data/api/api_repo.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/model/five_day_weather_model.dart';
import 'package:weather_app/shared/components/constant.dart';

class WeatherServices {
  String? city;
  double? lat;
  double? lon;
  WeatherServices({this.city, this.lat, this.lon});

  String baseUrl = AppConstants.baseURL;
  String apiKey = AppConstants.apiKey;

  void getCurrentWeatherData({
    Function()? loaded,
    Function(CurrentWeather currentWeather)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = "$baseUrl/weather?q=$city&$apiKey";
    ApiRepo(url: url).getData(
        loaded: () => {
              if (loaded != null)
                {
                  loaded(),
                },
            },
        onSuccess: (data) => {
              onSuccess!(CurrentWeather.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  log(error),
                  onError(error),
                }
            });
  }

  void getCurrentLocationWeatherData({
    Function()? loaded,
    Function(CurrentWeather currentLocationWeather)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = "$baseUrl/weather?lat=$lat&lon=$lon&$apiKey";
    ApiRepo(url: url).getData(
        loaded: () => {
              if (loaded != null)
                {
                  loaded(),
                },
            },
        onSuccess: (data) => {
              onSuccess!(CurrentWeather.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  log(error),
                  onError(error),
                }
            });
  }

  void getFiveForecastData({
    Function()? loaded,
    Function(List<FiveDayWeather> fiveDayWeather)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = "$baseUrl/forecast?q=$city&$apiKey";
    ApiRepo(url: url).getData(
        loaded: () => {
              if (loaded != null)
                {
                  loaded(),
                },
            },
        onSuccess: (data) => {
              onSuccess!((data['list'] as List)
                  .map((t) => FiveDayWeather.fromJson(t))
                  .toList()),
            },
        onError: (error) => {
              if (onError != null)
                {
                  log(error),
                  onError(error),
                }
            });
  }
}
