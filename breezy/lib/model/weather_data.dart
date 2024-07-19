import 'package:breezy/model/weather_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  WeatherData([this.current]);

  //fetch
  WeatherDataCurrent? getCurrentWeather() => current;
  

}