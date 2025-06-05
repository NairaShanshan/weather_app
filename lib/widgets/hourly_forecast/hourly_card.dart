import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),

      ) ,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('3:15' , style: TextStyle(
              fontSize: 20 ,
            ),),
            SizedBox(
              height: 5,
            ),
            Icon(Icons.sunny , color: Colors.yellow,size: 28,),
            SizedBox(
              height: 5,
            ),
            Text('26' ,
             style: TextStyle(
               fontSize: 20
             ),) ,

          ],
        ),
      ),
    );
  }
}
