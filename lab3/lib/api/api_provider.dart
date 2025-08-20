//import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab3/models/product_model.dart';
import 'package:lab3/models/user_model.dart';


class ApiProvider {
  static const String baseUrl = "https://dummyjson.com";
  ProductsModel? productsFromApi;
  Future getAllProduct() async {
    final Response response = await Dio().get(
      "$baseUrl/products",
      queryParameters: {
        "select": "id,title,description,category,price,thumbnail",
      },
    );

    if (response.statusCode == 200) {
      // log("Response data : ${response.data.toString()}");
      productsFromApi = ProductsModel.fromJson(response.data);
      print(productsFromApi!.products[1].title);
      return productsFromApi;
    } else {
      throw Exception("faild to load products");
    }
  }

  Future userLogin({required String userName, required String password}) async {
    FormData userData = FormData.fromMap({
      "username": userName,
      "password": password,
    });

    final Response response = await Dio().post(
      '$baseUrl/auth/login',
    //  data: {"username": username, "password ": password},
    data: userData,
    );
    if (response.statusCode == 200) {
      print(response.data["accessToken"]);
      print(response.data);

      return response.data;
    } else {
      throw Exception("Faild to Login");
    }
  }

  late UserModel userModel;
  Future<UserModel> getUserData() async{
    await FirebaseFirestore.instance.collection('users').doc('user2').get().then((value){
          print(value.data());

          userModel = UserModel.fromJson(value.data()!);
          print(userModel.name);
    });
    return userModel;
  }
}
