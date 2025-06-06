import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/presentation/providers/hourly_weather_provider.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard({super.key, required this.data});
  final HourlyModel data;

  @override
  Widget build(BuildContext context) {

    final hourlyProvider = Provider.of<HourlyWeatherProvider>(context) ;

    if (hourlyProvider.isLoading) {
      return const CircularProgressIndicator(color: Colors.white);
    }
    return  Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),

      ) ,
      child: Padding(
        padding:const  EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("${data.dateTime.hour.toString().padLeft(2, '0')}:${data.dateTime.minute.toString().padLeft(2, '0')}" , style: const TextStyle(
              fontSize: 20 ,
            ),),
            const SizedBox(
              height: 5,
            ),
            Image.network(
              'https://openweathermap.org/img/wn/${data.iconCode}@2x.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("${data.temperature.round()}°C",
             style:const TextStyle(
               fontSize: 20
             ),) ,

          ],
        ),
      ),
    );
  }
}
