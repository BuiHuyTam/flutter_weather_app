// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_crud/app/data/model/weather_data_hourly.dart';
import 'package:flutter_crud/app/modules/chart/controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class HourlyWeatherChart extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  String date = DateFormat("yMMMMd").format(DateTime.now());
  RxInt cardIndex = Controller().getIndex();
  HourlyWeatherChart({super.key, required this.weatherDataHourly});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bar chart example"),
      ),
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: "Hourly Weather Chart"),
          legend: Legend(isVisible: true),
          series: <CartesianSeries<Hourly, String>>[
            // spline series
            SplineSeries<Hourly, String>(
              width: 1,
              color: Color.fromARGB(255, 148, 163, 238),
              enableTooltip: true,
              dataSource: weatherDataHourly.hourly,
              xValueMapper: (Hourly hourly, _) => hourly.dt.toString(),
              yValueMapper: (Hourly hourly, _) => hourly.temp,
            ),
            // Column serires
            ColumnSeries<Hourly, String>(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              width: 1,
              spacing: 0,
              color: Color.fromARGB(255, 148, 163, 238),
              enableTooltip: true,
              dataSource: weatherDataHourly.hourly,
              xValueMapper: (Hourly hourly, _) => hourly.dt.toString(),
              yValueMapper: (Hourly hourly, _) => hourly.temp,
            ),
          ],
          crosshairBehavior: CrosshairBehavior(
              enable: true,
              lineColor: Colors.red,
              activationMode: ActivationMode.singleTap),
        ),
      ),
    );
  }
}
