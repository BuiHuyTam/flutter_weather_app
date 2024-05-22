import 'package:flutter/material.dart';
import 'package:flutter_crud/app/data/model/weather_data_current.dart';
import 'package:flutter_crud/core/utils/functions/format_temp.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeather({super.key, required this.weatherDataCurrent});
  int truncateFunction(int temp) {
    return (temp / 10).truncate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${FormatTemp(temp: weatherDataCurrent.current.temp!).formatted()}°C',
          style: const TextStyle(fontSize: 60),
        ),
        Text('${weatherDataCurrent.current.weather![0].description}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('H: ${weatherDataCurrent.current.humidity}°'),
            const SizedBox(
              width: 10,
            ),
            Text('L: ${weatherDataCurrent.current.feelsLike}°')
          ],
        ),
      ],
    );
  }
}
