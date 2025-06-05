import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_app/widgets/daily_details/daily_details.dart';
import 'package:weather_app/widgets/daily_forecast/daily_list.dart';
import 'package:weather_app/widgets/hourly_forecast/hourly_card.dart';
import 'package:weather_app/widgets/hourly_forecast/hourly_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00A1FF),
      appBar: AppBar(
        backgroundColor:Color(0xff00A1FF) ,
        title:const  Text('Weather App' , style: TextStyle(fontSize: 25),),
        elevation: 0.0,
      ),
      body: const  Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  TextField(
                     decoration: InputDecoration(
                       fillColor: Colors.white,
                      labelText: 'Search ' ,
                      labelStyle: TextStyle(
                        color: Colors.white
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.white,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                      )
                    ) ,

                  ),
                  SizedBox(height: 20,),
                  Text('Cairo'  ,style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold ,
                  ),),
                  // Image(
                  //   image: AssetImage("assets/sunny_2d.png") ,
                  //   height: 100,
                  //   width: 100,
                  // ),
                  SizedBox(height: 10,),
                  Text('25'  ,style: TextStyle(
                    fontSize: 90.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold ,
                  ),),
                  Text('Sunny'  ,style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold ,
                  ),),
                ],
              ),
              SizedBox(height: 30,),
              Text('Hourly Forecast' ,
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ) ,
              SizedBox(height: 20,),
              HourlyList(),
              SizedBox(height: 20,),
              Text('Daily Details' ,
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ) ,
              SizedBox(height: 20,),
              DailyDetails(),
              SizedBox(height: 20,),
              Text('Daily Forecast' ,
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ) ,
              SizedBox(height: 20,),
              DailyList(),

            ],
          ),
        ),
      ),

    );
  }
}

