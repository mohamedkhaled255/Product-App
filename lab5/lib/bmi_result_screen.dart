import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
   BmiResultScreen({super.key, required this.isMale, required this.result, required this.AGE});
final bool isMale;
final double result;
final int AGE;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: true,
      
        backgroundColor: Colors.blueAccent,
        title: Text("BMI Result",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children: [
            Text("GENDER : ${isMale==true ?"Male":"female"}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             Text("RESULT : ${result.round()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text("AGE : $AGE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}