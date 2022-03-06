import '../../login/model/login_response_model.dart';
import '../model/register_model.dart';

abstract class IRegisterService {
  Future<LoginResponseModel?> registerUser(RegisterModel model);
}
