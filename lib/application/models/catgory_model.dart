import 'package:flutter/material.dart';

class CategoryModel{

  String? label;

  Color? color;

  String? iconUrl;


  CategoryModel({
    this.label,
    this.color,
    this.iconUrl
 });
}


class PopularDestination{
  String? namePlace;

  bool? isFavorite = false;

  double? pointRating = 0;

  double? height;

  String? imageUrl;

  PopularDestination({
    this.namePlace,
    this.isFavorite,
    this.pointRating,
    this.height,
    this.imageUrl
  });
}