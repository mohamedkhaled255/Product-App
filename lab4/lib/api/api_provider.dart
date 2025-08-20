//import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:lab4/models/products_model.dart';

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

  Future userLogin({required String username, required String password}) async {
   /* FormData userData = FormData.fromMap({
      "username": username,
      "password ": password,
    });*/

    final Response response = await Dio().post(
      '$baseUrl/auth/login',
      data: {"username": username, "password ": password},
    );
    if (response.statusCode == 200) {
      print(response.data["accessToken"]);
      return response.data;
    } else {
      throw Exception("Faild to Login");
    }
  }
}
