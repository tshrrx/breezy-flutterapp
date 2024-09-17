import "package:breezy/additionals/custom_colors.dart";
import "package:breezy/model/weather_hourly.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyDataWidget({super.key, required this.weatherDataHourly});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: const Text("Today",style: TextStyle(fontSize: 18)),
        ),
        hourlyList()
      ],
    );
  }


  Widget hourlyList(){
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12 ? 12: weatherDataHourly.hourly.length,
        itemBuilder: (context, index){
          return GestureDetector(child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(offset:const Offset(0.5,0), blurRadius: 30, spreadRadius: 1,color: CustomColors.dividerLine.withAlpha(150))
              ],
              gradient: const LinearGradient(colors: [
                CustomColors.firstGradiant,
                CustomColors.secondGradiant
              ])),
              child: HourlyDetails(
                temp: weatherDataHourly.hourly[index].temp!,
                timeStamp: weatherDataHourly.hourly[index].dt!,
                weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
              ) ,
          ));
        },
      ),
    );
  }


}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;

  String getTime(final timeStamp){
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    String x = DateFormat('jm').format(date);
    return x;
  }

  HourlyDetails({super.key, required this.timeStamp, required this.weatherIcon, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Container(
        child: Text(getTime(timeStamp)),
      )],
    );
  }
}