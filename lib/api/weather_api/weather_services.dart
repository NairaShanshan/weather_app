import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/daily_weather_model.dart';
import 'package:weather_app/models/hourly_weather_model.dart';


class WeatherService {
  final String apiKey = '65fa1a915f0b6d47e004968f9744597c';

  Future<WeatherModel> fetchCurrentWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<HourlyModel>> fetchHourlyWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<dynamic> hourlyData = data['list'];

      return hourlyData.map((item) => HourlyModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load hourly weather');
    }
  }

  Future<List<DailyForecastModel>> fetchDailyForecast(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> rawList = data['list'];

      // فلترة علشان نجيب قراءة وحدة في اليوم (مثلاً الساعة 12 ظهرًا)
      final dailyList = rawList.where((item) {
        final dateTime = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
        return dateTime.hour == 12;
      }).toList();

      return dailyList
          .map((item) => DailyForecastModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load daily forecast');
    }
  }

  // Future<double> fetchUVIndex(double lat, double lon) async {
  //   final url = Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,hourly,daily,alerts&appid=$apiKey'
  //   );
  //
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return (data['current']['uvi'] as num).toDouble();
  //   } else {
  //     throw Exception('Failed to load UV index');
  //   }
  // }


}

