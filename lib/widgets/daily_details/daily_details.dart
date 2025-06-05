import 'package:flutter/material.dart';

class DailyDetails extends StatelessWidget {
  const DailyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3 ,
        children: const  [
          DetailsColumn(icon: Icons.sunny, text: 'VV', value: '8 Strong') ,
          DetailsColumn(icon: Icons.science, text: 'Temp', value: '29°') ,
          DetailsColumn(icon: Icons.hub, text: 'Humidity', value: '54%') ,
          DetailsColumn(icon: Icons.air, text: 'Wind', value: '18 km/h'),
          DetailsColumn(icon: Icons.compress, text: 'Pressure', value: '1014 hpa') ,
          DetailsColumn(icon: Icons.visibility, text: 'Visibility', value: '54 km') ,

        ],
    );
  }
}

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key  , required this.text , required this.value , required this.icon });

  final  IconData icon ;
  final  String  text ;
  final  String  value ;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:const  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon , size: 30,) ,
           const  SizedBox(height: 5,),
            Text(text , style: TextStyle(fontSize: 18),),
            const  SizedBox(height: 5,),
            Text(value , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    ) ;
  }
}



