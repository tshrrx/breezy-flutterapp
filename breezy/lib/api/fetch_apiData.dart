// ignore: file_names
import 'dart:convert';

import 'package:breezy/api/api_key.dart';
import 'package:breezy/model/weather_current.dart';
import 'package:breezy/model/weather_data.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI{
  WeatherData? weatherData;

  Future<WeatherData?> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiURL(lat, long)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData;
  }
}

String apiURL(var lat, var long){
  String url;
  url ="https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=1$long&appid=$apiKEY&units=metric&exclude=minutely";
  return url;
}