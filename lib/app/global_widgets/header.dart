import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import '../modules/home/controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final Controller controller = Get.put(Controller(), permanent: true);
  @override
  void initState() {
    // TODO: implement initState
    getAddress(
        controller.getLattitude().value, controller.getLongtitude().value);
    super.initState();
  }

  getAddress(double latitude, double longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
    print(placemark);
    setState(() {
      city = place.country!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          // city name
          child: Text(
            city,
            style: const TextStyle(fontSize: 40),
          ),

          // temperature
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.center,
          child: Text(date),
        )
      ],
    );
  }
}
