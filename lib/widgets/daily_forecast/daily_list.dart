import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/providers/daily_weather_provider.dart';
import 'package:weather_app/widgets/daily_forecast/daily_card.dart';

class DailyList extends StatelessWidget {
  const DailyList({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<DailyForecastProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final forecast = provider.dailyForecast;

    if (forecast.isEmpty) {
      return const Center(child: Text("No forecast data"));
    }

    return ListView.builder(
        itemBuilder: (context, index) {
          final item = forecast[index];
          return DailyCard(
            date: item.date,
            iconCode: item.iconCode,
            temperature: item.temperature,
          );
        },
        itemCount: forecast.length,
       shrinkWrap: true,
       physics:const  NeverScrollableScrollPhysics(),


    );
  }
}
