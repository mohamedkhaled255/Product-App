import 'package:flutter/material.dart';
import 'package:lab6/archive_screen.dart';
import 'package:lab6/done_screen.dart';
import 'package:lab6/tasks_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List <Widget> screens = [TasksScreen(),DoneScreen(),ArchiveScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks App"),centerTitle: true,),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body: screens[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.amber,
       // elevation: 0,
    //  selectedItemColor: Colors.green,
     // selectedLabelStyle: TextStyle(color: Colors.amber),
    // selectedIconTheme: IconThemeData(color: Colors.black),
   //  unselectedIconTheme: IconThemeData(color: Colors.yellow),
     currentIndex: currentIndex,
     onTap: (index) {
       setState(() {
         currentIndex =index;
       });
     },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu),label: "Taskes"),
           BottomNavigationBarItem(icon: Icon(Icons.check),label: "Done"),
            BottomNavigationBarItem(icon: Icon(Icons.archive),label: "Archive")

      ]),
    );
  }
}