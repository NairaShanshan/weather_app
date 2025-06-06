class HourlyModel {
  final DateTime dateTime;
  final double temperature;
  final String iconCode;

  HourlyModel({
    required this.dateTime,
    required this.temperature,
    required this.iconCode,
  });

  factory HourlyModel.fromJson(Map<String, dynamic> json) {
    return HourlyModel(
      dateTime: DateTime.parse(json['dt_txt']),
      temperature: json['main']['temp'].toDouble(),
      iconCode: json['weather'][0]['icon'] ?? '01d',
    );
  }
}
