

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

  factory ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      id: jsonData['id'] ?? 0,
      title: jsonData['title'] ?? "No Title",
      price: jsonData['price'] is String
          ? jsonData['price']
          : jsonData['price'].toString(),
      description: jsonData['description'] ?? "No Description",
      category: jsonData['category'] ?? "No Category",
      image: jsonData['image'] ?? "",
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : RatingModel(rate: 0.0, count: 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num?)?.toDouble() ?? 0.0,
      count: jsonData['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
