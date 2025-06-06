import 'package:flutter/cupertino.dart';
import 'package:weather_app/api/weather_api/weather_services.dart';
import 'package:weather_app/models/hourly_weather_model.dart';

class HourlyWeatherProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  List<HourlyModel> hourlyWeather = [];
  bool isLoading = false;


  Future<void> fetchHourly(String cityName) async {
    isLoading = true;
    notifyListeners();

    try {
      hourlyWeather = await _weatherService.fetchHourlyWeather(cityName);
    } catch (e) {
      print("Error fetching hourly weather: $e");
      hourlyWeather = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
