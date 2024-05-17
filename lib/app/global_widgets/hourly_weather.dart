import 'package:flutter/material.dart';
import 'package:flutter_crud/app/data/model/weather_data_hourly.dart';
import 'package:flutter_crud/app/modules/home/controller.dart';
import 'package:flutter_crud/core/utils/functions/format_temp.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HourlyWeather extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  RxInt cardIndex = Controller().getIndex();
  HourlyWeather({super.key, required this.weatherDataHourly});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            "Today",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weatherDataHourly.hourly.length > 12
                  ? 20
                  : weatherDataHourly.hourly.length,
              itemBuilder: (context, index) {
                return Obx((() => GestureDetector(
                    onTap: () {
                      cardIndex.value = index;
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 5),
                      width: 100,
                      child: HourlyWidget(
                        temp: weatherDataHourly.hourly[index].temp!,
                        timeStamp: weatherDataHourly.hourly[index].dt!,
                        weatherIcon:
                            weatherDataHourly.hourly[index].weather![0].icon!,
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.5, 0),
                                blurRadius: 30,
                                spreadRadius: 1,
                                color: Colors.grey.shade300)
                          ],
                          borderRadius: BorderRadius.circular(12),
                          gradient: cardIndex.value == index
                              ? LinearGradient(
                                  colors: [Colors.blue, Colors.blue.shade400])
                              : null),
                    ))));
              }),
        )
      ],
    );
  }
}

class HourlyWidget extends StatelessWidget {
  //variables
  int temp;
  int timeStamp;
  String weatherIcon;

  // methods
  String getTime(final timeStamp) {
    DateTime time =
        DateTime.fromMicrosecondsSinceEpoch(timeStamp * 1000, isUtc: true);
    time = time.toLocal();
    String formattedTime = DateFormat('jm').format(time);
    return formattedTime;
  }

  HourlyWidget(
      {super.key,
      required this.temp,
      required this.timeStamp,
      required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp)),
        ),
        Container(
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("${FormatTemp(temp: temp).formatted()}°C"),
        )
      ],
    );
  }
}
