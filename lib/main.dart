import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/providers/current_weather_provider.dart';
import 'package:weather_app/presentation/screens/home/home_screen.dart';

import 'presentation/providers/hourly_weather_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CurrentWeatherProvider()),
      ChangeNotifierProvider(create: (_) => HourlyWeatherProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
