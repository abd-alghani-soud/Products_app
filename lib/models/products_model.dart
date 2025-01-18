class ProductsModel {
  final int id;
  final String title;
  final double price;
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
      id: jsonData['id'] as int? ?? 0,
      title: jsonData['title'] as String? ?? "No Title",
      price: (jsonData['price'] as num?)?.toDouble() ?? 0.0,
      description: jsonData['description'] as String? ?? "No Description",
      category: jsonData['category'] as String? ?? "No Category",
      image: jsonData['image'] as String? ?? "",
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'] as Map<String, dynamic>)
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductsModel &&
              runtimeType == other.runtimeType &&
              id == other.id;
  @override
  int get hashCode => id.hashCode;
  @override
  String toString() {
    return 'ProductsModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
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
      count: jsonData['count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  @override
  String toString() {
    return 'RatingModel(rate: $rate, count: $count)';
  }
}