// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      email: json['Email'] as String?,
      password: json['Password'] as String?,
      passwordRetry: json['PasswordRetry'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'PasswordRetry': instance.passwordRetry,
    };
