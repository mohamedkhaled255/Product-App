import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter =1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 140, 100),
        leading: Icon(Icons.menu),
        title:Text("Home Screen"),
        centerTitle: true,
        actions: [
          Icon(Icons.add),
          IconButton(onPressed: (){
            setState(() {
              counter++;
            });

          }, icon: Text("$counter"))
        ],
      ),
    );
  }
}