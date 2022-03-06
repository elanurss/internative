import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/enums/network_enum.dart';
import '../../login/model/login_response_model.dart';
import '../model/register_model.dart';
import 'IRegisterService.dart';

class RegisterService extends IRegisterService {
  @override
  Future<LoginResponseModel?> registerUser(RegisterModel model) async {
    Map data = {
      "Email": model.email,
      "Password": model.password,
      "PasswordRetry": model.passwordRetry
    };

    String body = json.encode(data);

    final response = await http.post(Uri.parse(NetworkUrl.SIGNUP.rawValue),
        headers: {"Content-Type": "application/json"}, body: body);

    if (response.statusCode == 200) {
      return loginResponseModelFromJson(response.body);
    }
  }
}
