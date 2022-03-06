import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class LoginResponseModel {
  LoginResponseModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<ValidationError>? validationErrors;
  bool? hasError;
  String? message;
  Data? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  Data({
    this.token,
  });

  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class ValidationError {
  ValidationError({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ValidationErrorToJson(this);
  }
}
