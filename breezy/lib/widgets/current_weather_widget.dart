import "package:breezy/additionals/custom_colors.dart";
import "package:breezy/model/weather_current.dart";
import "package:flutter/material.dart";

class CurrentWeatherWidget extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key,required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //temp
        temperatureAreaWidget(),

        const SizedBox(height: 20,),
        //more details
        currentWeatherDetailsWidget(),
      ],
    );
  }
  Widget temperatureAreaWidget() {
    return Row(
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.current.temp!.toInt()}°C",
                style: const TextStyle(
                  color:CustomColors.textColorBlack,
                  fontSize: 68,
                  fontWeight: FontWeight.w600
                  ),
              ),
              TextSpan(
                text: "${weatherDataCurrent.current.weather![0].description}",
                style: const TextStyle(
                  color:Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                  ),
              )
            ])
        )
      ],
    );
  }


  Widget currentWeatherDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png"),    
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/clouds.png"),    
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/humidity.png"),    
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.windSpeed}km/hr",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              ),  
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.clouds}%",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              ),  
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.humidity}%",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              ),  
            )
          ],
        )
      ],
    );
  }
}