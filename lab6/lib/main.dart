import 'package:flutter/material.dart';
import 'package:lab6/layout_screen.dart';

void main() {
  runApp(const Tasks());
}

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        useMaterial3: false
      ),
      home: LayoutScreen()
    );
  }
}

