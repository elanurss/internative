import '../../helper/ui_helper.dart';

enum NetworkUrl { SIGN_IN, SIGNUP, GetCategories, GetBlogs }

extension NetworkRoutesString on NetworkUrl {
  String get rawValue {
    switch (this) {
      case NetworkUrl.SIGN_IN:
        return "${UIHelper.baseURL}/Login/SignIn";
      case NetworkUrl.SIGNUP:
        return "${UIHelper.baseURL}/Login/SignUp";
      case NetworkUrl.GetCategories:
        return "${UIHelper.baseURL}/Blog/GetCategories";
      case NetworkUrl.GetBlogs:
        return "${UIHelper.baseURL}/Blog/GetBlogs";
      default:
        throw Exception("error NetworkRoutesString");
    }
  }
}
