class DailyForecastModel {
  final DateTime date;
  final String iconCode;
  final double temperature;

  DailyForecastModel({
    required this.date,
    required this.iconCode,
    required this.temperature,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    return DailyForecastModel(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      iconCode: json['weather'][0]['icon'],
      temperature: (json['main']['temp'] as num).toDouble(),
    );
  }
}
