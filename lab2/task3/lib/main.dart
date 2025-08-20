import 'package:flutter/material.dart';

void main() {
  runApp(Task3());
}

class Task3 extends StatelessWidget {
  const Task3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 600,
                height: 600,
                color: Color(0xfffeea51),
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  color: Color(0xff4bad56),
                  width: 500,
                  height: 400,
                ),
              ),
              Container(
                color: Color(0xff9e9e9e),
                width: 300,
                height: 500,
                alignment: Alignment(0, 0),
                child: Container(
                  color: Color(0xff1796ef),
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text("C 3", style: TextStyle(fontSize: 35)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
