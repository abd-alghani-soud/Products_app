class ProductsModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromJson(jsonData) {
    return ProductsModel(
      id: jsonData['id'] ?? 0,
      title: jsonData['title'] ?? "No Title",
      price: (jsonData['price']) ?? 0.0,
      description: jsonData['description'] ?? "No Description",
      category: jsonData['category'] ?? "No Category",
      image: jsonData['image'] ?? "",
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : RatingModel(rate: 0.0, count: 0),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num?)?.toDouble() ?? 0.0,
      count: jsonData['count'] ?? 0,
    );
  }
}
