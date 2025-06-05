import 'package:flutter/material.dart';
import 'package:weather_app/widgets/hourly_forecast/hourly_card.dart';

class HourlyList extends StatelessWidget {
  const HourlyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView.builder(
          itemBuilder: (context , index) => HourlyCard() ,
          itemCount: 20,
          scrollDirection: Axis.horizontal,
      ),
    );
  }
}
