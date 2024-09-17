import 'package:breezy/model/weather_current.dart';
import 'package:breezy/model/weather_daily.dart';
import 'package:breezy/model/weather_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);
  //fetch
  WeatherDataCurrent? getCurrentWeather() => current!;
  WeatherDataHourly? getHourlyWeather() => hourly!;
  WeatherDataDaily? getDailyWeather() => daily!;

}