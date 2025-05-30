class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final ProductRatingModel rating;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.image,
    required this.category,
    required this.rating,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      title: json['title'] ?? "",
      image: json['image'] ?? "",
      category: json['category'] ?? "",
      rating: ProductRatingModel.fromJson(json['rating'] ?? {}),
      description: json['description'] ?? "",
    );
  }
}

class ProductRatingModel {
  final double rate;
  final int count;

  ProductRatingModel({required this.count, required this.rate});

  factory ProductRatingModel.fromJson(Map<String, dynamic> json) {
    return ProductRatingModel(
      count: json['count'] ?? 0,
      rate: (json['rate'] ?? 0).toDouble(),
    );
  }
}
