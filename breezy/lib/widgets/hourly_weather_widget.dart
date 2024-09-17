import "package:breezy/additionals/custom_colors.dart";
import "package:breezy/controller/global_controller.dart";
import "package:breezy/model/weather_hourly.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});


  //card

  final RxInt cardIndex = GlobalController().getIndext();

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
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12 ? 15: weatherDataHourly.hourly.length,
        itemBuilder: (context, index){
          return Obx((() => GestureDetector(
            onTap: (){
              cardIndex.value = index;
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(left: 20, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(offset:const Offset(0.5,0), blurRadius: 30, spreadRadius: 1,color: CustomColors.dividerLine.withAlpha(150))
              ],
              gradient: cardIndex.value == index ? const LinearGradient(colors: [
                CustomColors.firstGradiant,
                CustomColors.secondGradiant
              ]) :null ),
              child: HourlyDetails(
                index: index,
                cardIndex: cardIndex.toInt(),
                temp: weatherDataHourly.hourly[index].temp!,
                timeStamp: weatherDataHourly.hourly[index].dt!,
                weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
              ) ,
          ))));
        },
      ),
    );
  }


}

// ignore: must_be_immutable
class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;
  int index;
  int cardIndex;

  HourlyDetails({super.key, required this.timeStamp, required this.weatherIcon, required this.temp, required this.cardIndex, required this.index});

  String getTime(final timeStamp){
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    String x = DateFormat('jm').format(date);
    return x;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [ Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(getTime(timeStamp),style: TextStyle(color: cardIndex == index ? Colors.white : CustomColors.textColorBlack),),
      ),
      Container(
        margin: const EdgeInsets.all(5),
        child: Image.asset("assets/weather/$weatherIcon.png", height: 40,width: 40,),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text("$temp°" ,style: TextStyle(color: cardIndex == index ? Colors.white : CustomColors.textColorBlack)),
      )
      ],
    );
  }
}