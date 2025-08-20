import 'package:flutter/material.dart';

class BuildStoryItemWidget extends StatelessWidget {
  const BuildStoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      width: 65,
                      child: Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'https://www.mosoah.com/wp-content/uploads/2019/11/%D8%B5%D9%88%D8%B1-%D8%A8%D8%B1%D9%85%D8%AC%D8%A93.jpg',
                                ),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("mohamed khaled",maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    );
  }
}