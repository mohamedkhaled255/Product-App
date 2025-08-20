import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Product App",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "This application allows users to browse products by categories, "
              "view details, and explore the latest items fetched from our API.\n\n"
              "Our goal is to provide a smooth shopping-like experience "
              "with fast navigation and clean design.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/711/711284.png",
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}