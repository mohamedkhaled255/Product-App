
// // import 'package:final_project/test/test_category_view_builder.dart';
// // import 'package:flutter/material.dart';

// // class TestHomeScreen extends StatelessWidget {
// //   const TestHomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     List<String> categories=['Beauty','smartphones','fragrances','groceries','furniture'];
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       appBar: AppBar(
// //         backgroundColor: Colors.deepPurple,
// //         centerTitle: true,
// //         title: const Text(
// //           "HomeScreen",
// //           style: TextStyle(fontSize: 28, color: Colors.white),
// //         ),
// //       ),
// //       body:
// //      TestCategoryViewBuilder()
      
      
// //       //  SizedBox(
// //       //   height: 100,
// //       //   child: ListView.builder(
// //       //     scrollDirection: Axis.horizontal,
// //       //     itemCount: categories.length,
// //       //     itemBuilder: (context,index){
// //       //      return CategoryItem(categoryName: categories[index]);
// //       //   }),
// //       // ),
      
// //     );
// //   }
// // }

// // class CategoryItem extends StatelessWidget {
// //   final String categoryName;
// //   const CategoryItem({
// //     super.key, required this.categoryName,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(10),
// //       child: Container(
// //         alignment: Alignment.center,
// //         width: 200,
// //         height: 100,
// //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:  Colors.deepPurple),
// //         child: Text(categoryName,style: TextStyle(fontSize: 25,color: Colors.white),),
// //       ),
// //     );
// //   }
// // }

// // // SizedBox(
// // //         height: 100,
// // //         child: ListView.builder(
// // //           scrollDirection: Axis.horizontal,
// // //           itemCount: categories.length,
// // //           itemBuilder: (context,index){
// // //            return CategoryItem(categoryName: categories[index]);
// // //         }),
// // //       ),

// import 'package:final_project/categories/category_view_builder.dart';
// import 'package:flutter/material.dart';

// class TestHomeScreen extends StatefulWidget {
//   const TestHomeScreen({super.key});

//   @override
//   State<TestHomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<TestHomeScreen> {
//   String selectedCategory = "smartphones";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: const Text(
//           "HomeScreen",
//           style: TextStyle(fontSize: 28, color: Colors.white),
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: [
//          CategoryList(
//             onCategorySelected: (category) {
//               setState(() {
//                 selectedCategory = category;
//               });
//             },
//           ),
//           CategoryViewBuilder(),
//         ],
//       ),

//     );
//   }
// }
// class CategoryList extends StatelessWidget {
//   final Function(String) onCategorySelected;

//    CategoryList({super.key, required this.onCategorySelected});

//   final List<String> categories = [
//     "smartphones",
//     "laptops",
//     "fragrances",
//     "skincare",
//     "groceries",
//     "home-decoration",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: SizedBox(
//         height: 60,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           itemCount: categories.length,
//           separatorBuilder: (_, __) => const SizedBox(width: 8),
//           itemBuilder: (context, index) {
//             final category = categories[index];
//             return ElevatedButton(
//               onPressed: () => onCategorySelected(category),
//               child: Text(category),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }