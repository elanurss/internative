// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      validationErrors: json['ValidationErrors'] as List<dynamic>?,
      hasError: json['HasError'] as bool?,
      message: json['Message'],
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'ValidationErrors': instance.validationErrors,
      'HasError': instance.hasError,
      'Message': instance.message,
      'Data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      title: json['Title'] as String?,
      image: json['Image'] as String?,
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'Title': instance.title,
      'Image': instance.image,
      'Id': instance.id,
    };
