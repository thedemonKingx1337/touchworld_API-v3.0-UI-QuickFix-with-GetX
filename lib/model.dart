import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? id;
  String? name;
  String? brand;
  String? image;
  String? price;
  String? description;

  ProductModel({
    this.id,
    this.name,
    this.brand,
    this.image,
    this.price,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "image": image,
        "price": price,
        "description": description,
      };
}
