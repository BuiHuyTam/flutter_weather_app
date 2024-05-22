import 'dart:convert';
import 'package:flutter_crud/app/data/model/weather_data.dart';
import 'package:flutter_crud/app/data/model/weather_data_current.dart';
import 'package:flutter_crud/app/data/model/weather_data_hourly.dart';
import 'package:flutter_crud/core/utils/helpers/keys.dart';
import 'package:http/http.dart' as http;

class FetchWeather {
  WeatherData? weatherData;

  String apiUrl(final lat, final lon, final apiKey) {
    String url;
    url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey";
    return url;
  }

  // GET: fetch data from openWeatherMap API
  Future<WeatherData> getData(lat, lon) async {
    final response = await http.get(Uri.parse(apiUrl(lat, lon, weatherKey)));
    if (response.statusCode == 200) {
      weatherData = WeatherData(
          WeatherDataCurrent.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>),
          WeatherDataHourly.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>));
      return weatherData!;
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
