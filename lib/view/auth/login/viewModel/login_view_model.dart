import 'package:flutter/material.dart';
import 'package:internativeapp/core/base/base_view_model.dart';
import 'package:internativeapp/core/constants/enums/preferences_key_enum.dart';
import 'package:internativeapp/core/extension/context_extension.dart';
import 'package:internativeapp/view/auth/login/model/login_model.dart';
import 'package:internativeapp/view/auth/login/model/login_response_model.dart';
import 'package:internativeapp/view/auth/login/service/login_service.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  BuildContext? context;
  LoginService? service;
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    service = LoginService();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool obscureText = true;

  @observable
  bool isLoading = false;

  @observable
  String emailValidateText = "";

  @observable
  String passwordValidateText = "";

  @action
  void isLoadingChange() => isLoading = !isLoading;

  @action
  void obscureChange() => obscureText = !obscureText;

  Future<void> fetchLoginUser() async {
    isLoadingChange();

    final response = await service!.loginUser(LoginModel(
        email: emailController?.text, password: passwordController?.text));
    if (response != null) {
      if (response.hasError!) {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            content: Text(response.message!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: context!.colors.secondary,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else if (!(response.hasError!)) {
        localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.data!.token.toString());
        navigationService.navigateToPageClear(path: "/home");
      }
      if (response.validationErrors != null) {
        validateControl(response.validationErrors);
      }
    }

    isLoadingChange();
  }

  validateControl(List<ValidationError>? validationErrors) {
    for (var map in validationErrors!) {
      if (map.key!.contains("Password")) {
        passwordValidateText = map.value!;
      } else if (map.key!.contains("Email")) {
        emailValidateText = map.value!;
      }
    }
  }
}
