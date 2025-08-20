import 'package:final_project/categories/category_tile.dart';
import 'package:final_project/categories/product_by_category.dart';
import 'package:flutter/material.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  
  final List<String> categories=[
  "beauty",
  "fragrances",
  "furniture",
  "groceries",
  "home-decoration",
  "kitchen-accessories",
  "laptops",
  "mens-shirts",
  "mens-shoes",
  "mens-watches",
  "mobile-accessories",
  "motorcycle",
  "skin-care",
  "smartphones",
  "sports-accessories",
  "sunglasses",
  "tablets",
  "tops",
  "vehicle",
  "womens-bags",
  "womens-dresses",
  "womens-jewellery",
  "womens-shoes",
  "womens-watches"
];

  String selectedCategory = "smartphones";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Products by Category"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // ======= قائمة الكاتيجوري =======
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryTile(
                  title: category,
                  isSelected: selectedCategory == category,
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: categories.length,
            ),
          ),

          
          Expanded(
            child: ProductByCategory(category: selectedCategory),
          ),
        ],
      ),
    );
  }
}


