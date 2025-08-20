class ProductsModel {
    List<Product> products;
    int total;
    int skip;
    int limit;

    ProductsModel({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    int id;
    String title;
    String description;
    String category;
    double price;
    String thumbnail;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.price,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "thumbnail": thumbnail,
    };
}
