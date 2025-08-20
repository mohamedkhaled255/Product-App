import 'package:flutter/material.dart';

void main() {
  runApp(const Task2());
}
class Task2 extends StatelessWidget {
  const Task2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            " I'm an App ",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.redAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                color: Colors.blue,
                width: 700,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 700,
                color: Colors.green,
                alignment: AlignmentDirectional(-1, 0),
                child: Container(color: Colors.yellow, width: 300, height: 300),
              ),
            ),
            Expanded(flex: 1, child: Container(color: Colors.blue, width: 700)),
          ],
        ),
      ),
    );
  }
}
