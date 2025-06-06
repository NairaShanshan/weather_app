import 'package:flutter/cupertino.dart';
import 'package:weather_app/api/weather_api/weather_services.dart';
import 'package:weather_app/models/current_weather_model.dart';

class CurrentWeatherProvider extends ChangeNotifier {

  final WeatherService _weatherService = WeatherService();

  WeatherModel? weatherData;

  bool isLoading = false;

  Future<void> fetchWeather(String cityName) async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedData = await _weatherService.fetchCurrentWeather(cityName);
      print("Fetched weather: $fetchedData");
      weatherData = fetchedData;

    } catch (e ,stacktrace ) {
      print("Error fetching weather: $e");

      print(stacktrace);
      weatherData = null;
    }

    isLoading = false;
    notifyListeners();
  }

}





