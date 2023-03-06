import 'dart:convert';

class ProductModel {
  final String name;
  final String category;
  final String price;
  final String? image;
  final String discountedPrice;
  final String rating;
  final String discountPercent;
  ProductModel({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    this.discountedPrice = '',
    required this.rating,
    this.discountPercent = '',
  });

  ProductModel copyWith({
    String? name,
    String? category,
    String? price,
    String? image,
    String? discountedPrice,
    String? rating,
    String? discountPercent,
  }) {
    return ProductModel(
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      image: image ?? this.image,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      rating: rating ?? this.rating,
      discountPercent: discountPercent ?? this.discountPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'image': image,
      'discountedPrice': discountedPrice,
      'rating': rating,
      'discountPercent': discountPercent,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      discountedPrice: map['discountedPrice'] ?? '',
      rating: map['rating'] ?? '',
      discountPercent: map['discountPercent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(name: $name, category: $category, price: $price, image: $image, discountedPrice: $discountedPrice, rating: $rating, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.name == name &&
        other.category == category &&
        other.price == price &&
        other.image == image &&
        other.discountedPrice == discountedPrice &&
        other.rating == rating &&
        other.discountPercent == discountPercent;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        category.hashCode ^
        price.hashCode ^
        image.hashCode ^
        discountedPrice.hashCode ^
        rating.hashCode ^
        discountPercent.hashCode;
  }
}
