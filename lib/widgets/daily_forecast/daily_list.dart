import 'package:flutter/material.dart';
import 'package:weather_app/widgets/daily_forecast/daily_card.dart';

class DailyList extends StatelessWidget {
  const DailyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => DailyCard() ,
        itemCount: 20,
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),


    );
  }
}
