import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

@JsonSerializable()
class LoginModel {
  LoginModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}
