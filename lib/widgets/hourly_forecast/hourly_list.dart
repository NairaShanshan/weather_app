import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/providers/hourly_weather_provider.dart';
import 'package:weather_app/widgets/hourly_forecast/hourly_card.dart';

class HourlyList extends StatelessWidget {
  const HourlyList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HourlyWeatherProvider>(context);
    final hourlyData = provider.hourlyWeather ;

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.white));
    }

    if (hourlyData.isEmpty) {
      return const Center(child: Text('No forecast data found'));
    }

    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView.builder(
          itemBuilder: (context , index) => HourlyCard(data: hourlyData[index],) ,
          itemCount: hourlyData.length,
          scrollDirection: Axis.horizontal,
      ),
    );
  }
}
