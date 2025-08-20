import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab3/api/api_provider.dart';
import 'package:lab3/models/user_model.dart';

class CreateUserScreen extends StatefulWidget {
  CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  late UserModel userModel;
  bool isLoading = true;
  getUser() async{
    userModel = await ApiProvider().getUserData();
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CreateUser", style: TextStyle(fontSize: 25))),
      body:isLoading? Center(child: CircularProgressIndicator()): Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CreateUser", style: TextStyle(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: "age",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "address",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
           
         //   Text("name : ${userModel.name}"),
          //   Text("age : ${userModel.age}"),
          //    Text("address : ${userModel.address}"),

            ElevatedButton(
              onPressed: () async {
                final docUser =  FirebaseFirestore.instance
                    .collection('users')
                    .doc("user2");
                    final user = UserModel(name: nameController.text, age: int.tryParse(ageController.text) ?? 0, address: addressController.text);
                final Map<String, dynamic> userData = user.tojson();
                await docUser.set(userData);
              },
              child: Text("CreateUser"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),
              onPressed: () async{
                final docUser =  FirebaseFirestore.instance
                    .collection('users')
                    .doc("user2");
                     await docUser.delete();
                     
                

            }, child:Text("Delete User") )
          ],
        ),
      ),
    );
  }
}
