import 'package:breezy/api/api_key.dart';

String apiURL(var lat, var long){
  String url;
  url ="https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&appid=$apiKEY&units=metric&exclude=minutely";
  return url;
}