import 'package:final_project/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
   // AboutAppScreen(),
    //AboutTeamScreen()

  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 
        selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
         // BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: "About App "),
          //BottomNavigationBarItem(icon: Icon(Icons.group), label: "About Team"),
        ],
      ),
    );
  }
}