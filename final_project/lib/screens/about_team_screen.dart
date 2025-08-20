import 'package:flutter/material.dart';

class AboutTeamScreen extends StatelessWidget {
  const AboutTeamScreen({super.key});

  final List<Map<String, String>> teamMembers = const [
    {
      "name": "Mohamed Khaled",
      "role": "Flutter Developer",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
    {
      "name": "Hosny Mohamed",
      "role": "Flutter Developer",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // surfaceTintColor: Colors.white,
       foregroundColor: Colors.white,
        title: const Text("About Team",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          final member = teamMembers[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(member["image"]!),
                radius: 28,
              ),
              title: Text(
                member["name"]!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(member["role"]!),
            ),
          );
        },
      ),
    );
  }
}