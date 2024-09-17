import "package:breezy/additionals/custom_colors.dart";
import "package:breezy/controller/global_controller.dart";
import "package:breezy/widgets/comfortLevel.dart";
import "package:breezy/widgets/current_weather_widget.dart";
import "package:breezy/widgets/header.dart";
import "package:breezy/widgets/hourly_weather_widget.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../widgets/daily_weather_widget.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
            child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderWidget(),
                  CurrentWeatherWidget(
                    weatherDataCurrent: globalController.getData().getCurrentWeather()!,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HourlyDataWidget(
                    weatherDataHourly: globalController.getData().getHourlyWeather()!,
                  ),
                  DailyDataWidget(
                    weatherDataDaily: globalController.getData().getDailyWeather()!,
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ComfortLevel(weatherDataCurrent: globalController.getData().getCurrentWeather()!)
                ],
              )
            )
        ),
      ),
    );
  }
}
