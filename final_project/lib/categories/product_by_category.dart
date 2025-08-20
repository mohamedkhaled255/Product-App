import 'package:dio/dio.dart';
import 'package:final_project/categories/product_category.dart';
import 'package:final_project/models/product_model.dart';
import 'package:final_project/services/product_services.dart';
import 'package:flutter/material.dart';

class ProductByCategory extends StatelessWidget {
  final String category;
  const ProductByCategory({super.key, required this.category});

  Future<ProductsModel> getProduct() async {
    return await ProductServices(dio: Dio()).getProduct(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<ProductsModel>(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
            return const Center(child: Text("No products found"));
          } else {
            final products = snapshot.data!.products;

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return ProductCategory(product: products[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}