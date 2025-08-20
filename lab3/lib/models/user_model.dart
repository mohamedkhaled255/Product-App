import 'dart:convert';

class UserModel {
  String name;
  num age;
   String address;
   UserModel({required this.name,required this.age,required this.address});

   factory UserModel.fromJson(Map<String,dynamic> json)=>
   UserModel(name: json['name'], age: json['age'], address: json["address"]);

   Map<String,dynamic> tojson() => {
    "name" :name,
    "age" :age,
    "address" :address
   };
  
}