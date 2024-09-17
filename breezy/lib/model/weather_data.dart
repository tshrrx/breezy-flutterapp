import 'package:breezy/model/weather_current.dart';
import 'package:breezy/model/weather_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;

  WeatherData([this.current, this.hourly]);
  //fetch
  WeatherDataCurrent? getCurrentWeather() => current!;
  WeatherDataHourly? getHourlyWeather() => hourly!;
  

}