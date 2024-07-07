import "package:breezy/controller/global_controller.dart";
import "package:flutter/material.dart";
import "package:geocoding/geocoding.dart";
import "package:get/get.dart";

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  String city = "";
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.fetchLat().value ,globalController.fetchLong().value);
    super.initState();
  }

  getAddress(lat,long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    print(placemark);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(city),
        ),
      ],
    );
  }
}