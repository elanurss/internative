import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'category_response_model.g.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  List<Data>? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  Data({
    this.title,
    this.image,
    this.id,
  });

  String? title;
  String? image;
  String? id;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}
