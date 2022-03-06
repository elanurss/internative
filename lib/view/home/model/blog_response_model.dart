import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'blog_response_model.g.dart';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

@JsonSerializable()
class BlogModel {
  BlogModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  List<BlogData>? data;

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$BlogModelToJson(this);
  }
}

@JsonSerializable()
class BlogData {
  BlogData({
    this.title,
    this.content,
    this.image,
    this.categoryId,
    this.id,
  });

  String? title;
  String? content;
  String? image;
  String? categoryId;
  String? id;

  factory BlogData.fromJson(Map<String, dynamic> json) =>
      _$BlogDataFromJson(json);

  Map<String, dynamic> toJson() {
    return _$BlogDataToJson(this);
  }
}
