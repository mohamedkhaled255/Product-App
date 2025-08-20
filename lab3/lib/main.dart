import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab3/firestore/create_user_screen.dart';
import 'package:lab3/register_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print("FireBase is ready");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        useMaterial3: false
      ),
      home: CreateUserScreen(),
    );
  }
}

