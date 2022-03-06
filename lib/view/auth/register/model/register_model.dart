import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

@JsonSerializable()
class RegisterModel {
  RegisterModel({
    this.email,
    this.password,
    this.passwordRetry,
  });

  String? email;
  String? password;
  String? passwordRetry;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$RegisterModelToJson(this);
  }
}
