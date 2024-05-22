import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/app/global_widgets/current_weather.dart';
import 'package:flutter_crud/app/global_widgets/header.dart';
import 'package:flutter_crud/app/global_widgets/hourly_weather.dart';
import 'package:flutter_crud/app/routes/app_routes.dart';
import 'package:get/get.dart';

import './controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Controller controller = Get.put(Controller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => controller.loading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Header(),
                      CurrentWeather(
                          weatherDataCurrent:
                              controller.getWeatherData().getCurrentWeather()),
                      HourlyWeather(
                          weatherDataHourly:
                              controller.getWeatherData().getHourlyWeather())
                    ],
                  ),
                ))),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          Get.toNamed(AppRoutes.FAVOURITES);
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: const [
          // Home
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          // Favourite
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add), label: "Favorites")
        ],
      ),
    );
  }
}
