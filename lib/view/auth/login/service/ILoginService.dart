import '../model/login_model.dart';
import '../model/login_response_model.dart';

abstract class ILoginService {
  Future<LoginResponseModel?> loginUser(LoginModel model);
}
