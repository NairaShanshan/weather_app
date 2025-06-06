import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyCard extends StatelessWidget {
  final DateTime date;
  final String iconCode;
  final double temperature;

  const DailyCard({
    super.key,
    required this.date,
    required this.iconCode,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.MMMd().format(date); // مثل "Jun 6"
    final dayLabel = DateTime.now().day == date.day ? "Today" : DateFormat.E().format(date); // مثل "Tue"

    return Card(
      shape:const  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Padding(
        padding:const  EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$formattedDate $dayLabel' , style:const  TextStyle(fontSize: 25)),
            Image.network(
              'https://openweathermap.org/img/wn/$iconCode@2x.png',
              width: 40,
              height: 40,
            ),
            Text('${temperature.round()}°' , style:const  TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
