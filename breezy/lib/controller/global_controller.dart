import 'package:breezy/api/fetch_apiData.dart';
import 'package:breezy/model/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  // Variables
  final RxBool isLoading = true.obs;
  final RxDouble lat = 0.0.obs;
  final RxDouble long = 0.0.obs;
  final RxInt currentIndex = 0.obs;

  // Instances
  RxBool checkLoading() => isLoading;
  RxDouble fetchLat() => lat;
  RxDouble fetchLong() => long;

  final weatherData = WeatherData().obs;
  WeatherData getData() {
    return weatherData.value;
  }


  @override
  void onInit() {
    if (isLoading.isTrue) {
      fetchLocation();
    } else {
      getIndext();
    }
    super.onInit();
  }

  fetchLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Location not enabled!");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied forever!");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied!");
      }
    }

    //current pos
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {

      lat.value = value.latitude;
      long.value = value.longitude;

      return FetchWeatherAPI().processData(value.latitude, value.longitude).then((value) {
          weatherData.value = value!;
          isLoading.value = false;
        });
    });
  }
  RxInt getIndext(){
    return currentIndex;
  }
}
