// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      validationErrors: json['ValidationErrors'] as List<dynamic>?,
      hasError: json['HasError'] as bool?,
      message: json['Message'],
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => BlogData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'ValidationErrors': instance.validationErrors,
      'HasError': instance.hasError,
      'Message': instance.message,
      'Data': instance.data,
    };

BlogData _$BlogDataFromJson(Map<String, dynamic> json) => BlogData(
      title: json['Title'] as String?,
      content: json['Content'] as String?,
      image: json['Image'] as String?,
      categoryId: json['CategoryId'] as String?,
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$BlogDataToJson(BlogData instance) => <String, dynamic>{
      'Title': instance.title,
      'Content': instance.content,
      'Image': instance.image,
      'CategoryId': instance.categoryId,
      'Id': instance.id,
    };
