import 'package:flutter/material.dart';

class ShoeModel {
  String? name;
  int? price;
  String? image;
  Color? color;
  ShoeModel({
    this.price,
    this.image,
    this.name,
    this.color,
  });
}

List<ShoeModel> shoes = [
  ShoeModel(
    name: "Nike Force 1",
    price: 59,
    image: "asset/nike force 1.png",
    color: Colors.brown.shade400,
  ),
  ShoeModel(
    name: "Air jordan 1",
    price: 42,
    image: "asset/air-jordan-1.png",
    color: Colors.green.shade400,
  ),
  ShoeModel(
    name: "Jordan 7",
    price: 89,
    image: "asset/jordan-7.png",
    color: Colors.deepOrange.shade400,
  ),
  ShoeModel(
    name: "Air Max 97",
    price: 12,
    image: "asset/alpha-savage.png",
    color: Colors.red.shade400,
  ),
];
