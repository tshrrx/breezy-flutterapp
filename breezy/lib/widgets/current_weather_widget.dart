import "package:breezy/model/weather_current.dart";
import "package:flutter/material.dart";

class CurrentWeatherWidget extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key,required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${weatherDataCurrent.current.windSpeed}'),
    );
  }
}