// import 'package:dio/dio.dart';
// import 'package:final_project/categories/product_category.dart';
// import 'package:final_project/models/product_model.dart';
// import 'package:final_project/services/product_services.dart';
// import 'package:flutter/material.dart';

// class TestCategoryViewBuilder extends StatelessWidget {
//   final String category;

//   const TestCategoryViewBuilder({super.key, required this.category});

//   Future<ProductsModel> getAllProduct() async {
//     return await ProductServices(dio: Dio()).getAllProduct();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ProductsModel>(
//       future: getAllProduct(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return SliverToBoxAdapter(
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text("Error: ${snapshot.error}"),
//               ),
//             ),
//           );
//         } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text("No products found"),
//               ),
//             ),
//           );
//         } else {
//           final filteredProducts = snapshot.data!.products
//               .where((product) => product.category == category)
//               .toList();

//           if (filteredProducts.isEmpty) {
//             return const SliverToBoxAdapter(
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text("No products in this category"),
//                 ),
//               ),
//             );
//           }

//           return SliverPadding(
//             padding: const EdgeInsets.all(12.0),
//             sliver: SliverGrid(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return ProductCategory(product: filteredProducts[index]);
//                 },
//                 childCount: filteredProducts.length,
//               ),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 childAspectRatio: 1,
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }