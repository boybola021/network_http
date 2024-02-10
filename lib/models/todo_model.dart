import 'dart:core';

class Todo {
  int id;
  int userId;
  String title;
  String body;

  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      body: json["body"],
    );
  }
}

/*
class Product {
  int id;
  double price;
  String title;
  String decription;
  String category;
  String image;
  //double rating;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.decription,
    required this.category,
    required this.image,
    //required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      price: json["price"],
      title: json["title"],
      decription: json["description"],
      category: json["category"],
      image: json["image"],
     // rating: json["category"],
    );
  }
}
*/