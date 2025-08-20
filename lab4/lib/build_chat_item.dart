import 'package:flutter/material.dart';

class BuildChatItem extends StatelessWidget {
  const BuildChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time, required this.image,
  });

  final String name;
  final String message;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            image
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                     
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(fontSize: 14, ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}