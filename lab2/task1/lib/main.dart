import 'package:flutter/material.dart';

void main() {
  runApp(Task1());
}
class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff009798),
        body: SafeArea(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.red,
                width: 200,
                child: Column(),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                color: Colors.yellow,
                width: 190,
                height: 150,
                child: Column(),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                color: Colors.green,
                width: 190,
                height: 150,
                child: Column(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.blue,
                width: 200,
                child: Column(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}