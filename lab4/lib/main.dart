import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lab4/screens/messenger_screen.dart';

void main() {
  runApp(Messenger());
}

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = MyBlocObserver();
    return MessengerScreen();
      
   
  }
}