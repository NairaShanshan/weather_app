import 'package:intl/intl.dart';

class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainWeather;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final int visibility;
  final double uvIndex;
  final String iconCode;
  final DateTime dateTime;
  final String formattedTime;
  final String formattedDate;
  final double lat;
  final double lon;


  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.mainWeather,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.visibility,
    required this.uvIndex,
    required this.iconCode,
    required this.dateTime,
    required this.formattedTime,
    required this.formattedDate,
    required this.lat,
    required this.lon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final rawDate = DateTime.fromMillisecondsSinceEpoch(
      (json['dt'] ?? 0) * 1000,
    );

    final formattedTime = DateFormat.Hm().format(rawDate);
    final formattedDate = DateFormat.yMMMMd().format(rawDate);

    return WeatherModel(
      cityName: json['name'] ?? 'Unknown',
      temperature: (json['main']?['temp'] as num?)?.toDouble() ?? 0.0,
      mainWeather: json['weather'] != null &&
          json['weather'] is List &&
          json['weather'].isNotEmpty
          ? json['weather'][0]['main'] ?? 'Clear'
          : 'Clear',
      humidity: json['main']?['humidity'] ?? 0,
      pressure: json['main']?['pressure'] ?? 0,
      windSpeed: (json['wind']?['speed'] as num?)?.toDouble() ?? 0.0,
      visibility: json['visibility'] ?? 0,
      uvIndex: 0.0, // OpenWeather current weather API doesn’t include UV
      iconCode: json['weather'] != null &&
          json['weather'] is List &&
          json['weather'].isNotEmpty
          ? json['weather'][0]['icon'] ?? ''
          : '',
      dateTime: rawDate,
      formattedTime: formattedTime,
      formattedDate: formattedDate,
      lat: json['coord']['lat'].toDouble(),
      lon: json['coord']['lon'].toDouble(),
    );
  }
}
