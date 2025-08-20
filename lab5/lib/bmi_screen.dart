import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab5/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double hightSlider = 180;
  int wEIGHT = 60;
  int AGE = 25;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 11, 21),
      appBar: AppBar(
        backgroundColor: Color(0xff090f1d),
        title: Text("BMI CALCULATOR", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isMale == true ? Colors.blue : Color(0xff1a1b2c),
                      ),

                      margin: EdgeInsets.all(20),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/th.webp', height: 150),
                          Text(
                            "MALE",
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isMale == true ? Color(0xff1a1b2c) : Colors.blue,
                      ),

                      margin: EdgeInsets.all(20),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/OIP.webp', height: 150),
                          Text(
                            "FEMALE",
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff1a1b2c),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${hightSlider.round()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: hightSlider,
                    onChanged: (value) {
                      setState(() {
                        hightSlider = value;
                      });
                    },
                    min: 100,
                    max: 220,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff1a1b2c),
                    ),

                    margin: EdgeInsets.all(20),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                        Text(
                          "$wEIGHT",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  wEIGHT++;
                                });
                              },
                              heroTag: "weight+add",
                              child: Icon(Icons.add),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  wEIGHT--;
                                });
                              },
                              heroTag: "weight+remove",
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff1a1b2c),
                    ),

                    margin: EdgeInsets.all(20),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                        Text(
                          "$AGE",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  AGE++;
                                });
                              },
                              heroTag: "weight+add",
                              child: Icon(Icons.add),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  AGE--;
                                });
                              },
                              heroTag: "weight+remove",
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffe6134a),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                double result = wEIGHT / pow(hightSlider / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResultScreen(
                      isMale: isMale,
                      result: result,
                      AGE: AGE,
                    ),
                  ),
                );
              },
              child: Text("CALCULATE"),
            ),
          ),
        ],
      ),
    );
  }
}
