import 'package:flutter/material.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('jun 2 tommorow' , style: TextStyle(fontSize: 25)),
            Icon(Icons.sunny , color: Colors.yellow, size:30 ,),
            Text('20' , style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
