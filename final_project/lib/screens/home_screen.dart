import 'package:final_project/categories/category_view_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "HomeScreen",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
      body:
      
       CategoryViewBuilder());
    
    
  }
}