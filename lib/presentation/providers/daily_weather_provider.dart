import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api/weather_services.dart';
import 'package:weather_app/models/daily_weather_model.dart';

class DailyForecastProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  List<DailyForecastModel> dailyForecast = [];
  bool isLoading = false;

  Future<void> fetchDailyForecast(String cityName) async {
    isLoading = true;
    notifyListeners();

    try {
      dailyForecast = await _weatherService.fetchDailyForecast(cityName);
    } catch (e) {
      print("Error fetching daily forecast: $e");
      dailyForecast = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
