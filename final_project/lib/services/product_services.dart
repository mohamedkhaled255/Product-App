import 'package:dio/dio.dart';
import 'package:final_project/models/product_model.dart';

class ProductServices {
  final Dio dio;
  final String baseUrl='https://dummyjson.com';
  ProductsModel? productsFromApI;

  ProductServices({required this.dio});

 Future getAllProduct() async{
      Response response = await Dio().get('$baseUrl/products?select=title,category,price,description,thumbnail');
      if (response.statusCode ==200) {
        
        productsFromApI= ProductsModel.fromJson(response.data);
        print(productsFromApI!.products[0].title);
        return productsFromApI;
      }else{
        throw Exception('faild to load products');
      }

      
  }
  Future getProduct({required String category}) async{
      Response response = await Dio().get('$baseUrl/products/category/$category?select=title,category,price,description,thumbnail');
      if (response.statusCode ==200) {
        
        productsFromApI= ProductsModel.fromJson(response.data);
        print(productsFromApI!.products[0].title);
        return productsFromApI;
      }else{
        throw Exception('faild to load products');
      }

      
  }
  
}