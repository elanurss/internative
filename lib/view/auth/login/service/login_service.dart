import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/enums/network_enum.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService {
  @override
  Future<LoginResponseModel?> loginUser(LoginModel model) async {
    Map data = {"Email": model.email, "Password": model.password};

    String body = json.encode(data);

    final response = await http.post(Uri.parse(NetworkUrl.SIGN_IN.rawValue),
        headers: {"Content-Type": "application/json"}, body: body);

    if (response.statusCode == 200) {
      return loginResponseModelFromJson(response.body);
    }
  }
}
