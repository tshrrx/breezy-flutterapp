// ignore: file_names
import 'dart:convert';

import 'package:breezy/additionals/url_api.dart';
import 'package:breezy/model/weather_current.dart';
import 'package:breezy/model/weather_daily.dart';
import 'package:breezy/model/weather_data.dart';
import 'package:breezy/model/weather_hourly.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI{
  WeatherData? weatherData;

  Future<WeatherData?> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiURL(lat, long)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString), WeatherDataDaily.fromJson(jsonString));
      
    
    return weatherData;
  }
}

