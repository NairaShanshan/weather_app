import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/presentation/providers/current_weather_provider.dart';
import 'package:weather_app/presentation/providers/daily_weather_provider.dart';
import 'package:weather_app/presentation/providers/hourly_weather_provider.dart';

import 'package:weather_app/widgets/daily_details/daily_details.dart';
import 'package:weather_app/widgets/daily_forecast/daily_list.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/hourly_forecast/hourly_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController searchController = TextEditingController() ;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final weatherProvider = Provider.of<CurrentWeatherProvider>(context, listen: false);
      await weatherProvider.fetchWeather("Cairo");

      Provider.of<HourlyWeatherProvider>(context, listen: false).fetchHourly("Cairo");
      Provider.of<DailyForecastProvider>(context, listen: false).fetchDailyForecast("Cairo");



    });

  }


  Future<void> searchWeather() async {
    final city = searchController.text.trim();
    if (city.isNotEmpty) {
      final currentProvider = Provider.of<CurrentWeatherProvider>(context, listen: false);
      final hourlyProvider = Provider.of<HourlyWeatherProvider>(context, listen: false);
      final dailyProvider = Provider.of<DailyForecastProvider>(context, listen: false); // ✅ مزود الديلي

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator(color: Colors.white)),
      );

      try {
        await currentProvider.fetchWeather(city);
        await hourlyProvider.fetchHourly(city);
        await dailyProvider.fetchDailyForecast(city); // ✅ استدعاء بيانات التنبؤ اليومي
      } catch (e) {
        print("Error while searching: $e");
      } finally {
        Navigator.of(context).pop(); // إغلاق الـ dialog
      }
    }
  }



  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<CurrentWeatherProvider>(context);
    final data = provider.weatherData;

    return Scaffold(
      backgroundColor:const Color(0xff00A1FF),
      appBar: AppBar(
        backgroundColor: const Color(0xff00A1FF) ,
        title:const  Text('Weather App' , style: TextStyle(fontSize: 25),),
        elevation: 0.0,
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor:  Color(0xff00A1FF) ,
          statusBarIconBrightness: Brightness.light
        ),
      ),
      body:   Padding(
        padding: const EdgeInsets.all(15.0),
        child: provider.isLoading ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : data == null
            ? const Center(child: Text("No data available", style: TextStyle(color: Colors.white)))
            :
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                     TextField(
                     controller: searchController,
                       onSubmitted: (_) async => await searchWeather(),
                       decoration: InputDecoration(
                         fillColor: Colors.white,
                        labelText: 'Search ' ,
                        labelStyle: const TextStyle(
                          color: Colors.white
                        ),
                        prefixIcon:const  Icon(Icons.search, color: Colors.white,),
                        suffixIcon: IconButton(onPressed: searchWeather, icon:const Icon(Icons.send)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0))
                        )
                      ) ,

                    ),
                    const SizedBox(height: 20,),
                    Text(data.cityName  ,style:const  TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold ,
                    ),),
                    // Image(
                    //   image: AssetImage("assets/sunny_2d.png") ,
                    //   height: 100,
                    //   width: 100,
                    // ),
                   const  SizedBox(height: 10,),
                    Text("${data.temperature.round()}°C"  ,style: const TextStyle(
                      fontSize: 90.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold ,
                    ),),
                    Text(data.mainWeather  ,style:const  TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold ,
                    ),),
                  ],
                ),
               const  SizedBox(height: 30,),
               const Text('Hourly Forecast' ,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold ,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ) ,
                const SizedBox(height: 20,),
                const HourlyList(),
                const SizedBox(height: 20,),
                const Text('Daily Details' ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold ,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ) ,
                const SizedBox(height: 20,),
                const DailyDetails(),
                const SizedBox(height: 20,),
                const Text('Daily Forecast' ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold ,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ) ,
                const SizedBox(height: 20,),
                const DailyList(),

              ],
            ),
          ),
        ),
      );


  }
}

