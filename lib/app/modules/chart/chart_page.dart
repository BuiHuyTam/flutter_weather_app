import 'package:flutter/material.dart';
import '../../global_widgets/hourly_chart.dart';
import 'package:get/get.dart';
import './controller.dart';

class WeatherChart extends StatelessWidget {
  WeatherChart({super.key});
  final Controller controller = Get.put(Controller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // display chart
      body: HourlyWeatherChart(
          weatherDataHourly: controller.getWeatherData().getHourlyWeather()),
    );
  }
}
