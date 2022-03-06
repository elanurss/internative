import 'package:flutter/material.dart';
import 'package:internativeapp/core/constants/enums/preferences_key_enum.dart';
import 'package:internativeapp/view/auth/login/model/login_response_model.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/base_view_model.dart';
import '../../../../core/extension/context_extension.dart';
import '../model/register_model.dart';
import '../service/register_service.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  BuildContext? context;
  RegisterService? service;
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? rePasswordController;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    service = RegisterService();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  String emailValidateText = "";

  @observable
  String passwordValidateText = "";

  @observable
  bool obscureText = true;

  @action
  void obscureChange() => obscureText = !obscureText;

  @observable
  bool reObscureText = true;

  @action
  void reObscureChange() => reObscureText = !reObscureText;

  @action
  void isLoadingChange() => isLoading = !isLoading;

  Future<void> fetchRegisterUser() async {
    isLoadingChange();

    final response = await service!.registerUser(RegisterModel(
        email: emailController?.text,
        password: passwordController?.text,
        passwordRetry: rePasswordController?.text));
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
