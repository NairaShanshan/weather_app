import 'package:flutter/material.dart';
import 'package:weather_app/presentation/providers/current_weather_provider.dart';
import 'package:provider/provider.dart';

class DailyDetails extends StatelessWidget {
  const DailyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrentWeatherProvider>(context);
    final data = provider.weatherData;

    if (data == null) {
      return const Center(
          child: Text("No data", style: TextStyle(color: Colors.white)));
    }

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 0.76,
      children: [
        DetailsColumn(
            icon: Icons.sunny,
            text: 'UV',
            value: '${data.uvIndex} Strong',
            iconColor: Colors.yellow.shade800),
        DetailsColumn(
            icon: Icons.thermostat,
            text: 'Temp',
            value: '${data.temperature.round()}°',
            iconColor: Colors.redAccent),
        DetailsColumn(
            icon: Icons.water_drop,
            text: 'Humidity',
            value: '${data.humidity}%',
            iconColor: Colors.blueAccent),
        DetailsColumn(
            icon: Icons.air,
            text: 'Wind',
            value: '${data.windSpeed.round()} km/h',
            iconColor: Colors.lightBlue.shade700),
        DetailsColumn(
            icon: Icons.compress,
            text: 'Pressure',
            value: '${data.pressure} hPa',
            iconColor: Colors.lime),
        DetailsColumn(
            icon: Icons.visibility,
            text: 'Visibility',
            value: '${(data.visibility / 1000).toStringAsFixed(1)} km',
            iconColor: Colors.grey.shade800),
      ],
    );
  }
}

class DetailsColumn extends StatelessWidget {
  const DetailsColumn(
      {super.key,
      required this.text,
      required this.value,
      required this.icon,
      required this.iconColor});

  final IconData icon;

  final String text;

  final String value;

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: iconColor),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
