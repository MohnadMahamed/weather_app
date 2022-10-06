class FiveDayWeather {
  final String? dateTime;
  final int? temp;

  FiveDayWeather({this.dateTime, this.temp});

  factory FiveDayWeather.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayWeather();
    }

    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    return FiveDayWeather(
      dateTime: fandl,
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
