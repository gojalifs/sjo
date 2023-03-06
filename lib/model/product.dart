// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Frame {
  final int frameId;
  final String name;
  final int stock;
  final String price;
  final String material;
  final String shape;
  final String description;
  final String? pictPath;
  final String? rating;
  Frame({
    required this.frameId,
    required this.name,
    required this.stock,
    required this.price,
    required this.material,
    required this.shape,
    required this.description,
    this.pictPath,
    this.rating,
  });

  Frame copyWith({
    int? frameId,
    String? name,
    int? stock,
    String? price,
    String? material,
    String? shape,
    String? description,
    String? pictPath,
    String? rating,
  }) {
    return Frame(
      frameId: frameId ?? this.frameId,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      price: price ?? this.price,
      material: material ?? this.material,
      shape: shape ?? this.shape,
      description: description ?? this.description,
      pictPath: pictPath ?? this.pictPath,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frameId': frameId,
      'name': name,
      'stock': stock,
      'price': price,
      'material': material,
      'shape': shape,
      'description': description,
      'pictPath': pictPath,
      'rating': rating,
    };
  }

  factory Frame.fromMap(Map<String, dynamic> map) {
    return Frame(
      frameId: map['frameId'] as int,
      name: map['name'] as String,
      stock: map['stock'] as int,
      price: map['price'] as String,
      material: map['material'] as String,
      shape: map['shape'] as String,
      description: map['description'] as String,
      pictPath: map['pictPath'] != null ? map['pictPath'] as String : null,
      rating: map['rating'] != null ? map['rating'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Frame.fromJson(String source) =>
      Frame.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FrameImages {
  int frameId;
  List<String> imgPath;
  FrameImages({
    required this.frameId,
    required this.imgPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frameId': frameId,
      'imgPath': imgPath,
    };
  }

  factory FrameImages.fromMap(Map<String, dynamic> map) {
    return FrameImages(
      frameId: map['frameId'] as int,
      imgPath: map['imgPath'] as List<String>,
    );
  }

  String toJson() => json.encode(toMap());

  factory FrameImages.fromJson(String source) =>
      FrameImages.fromMap(json.decode(source) as Map<String, dynamic>);
}
