// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$obscureTextAtom = Atom(name: '_LoginViewModelBase.obscureText');

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$emailValidateTextAtom =
      Atom(name: '_LoginViewModelBase.emailValidateText');

  @override
  String get emailValidateText {
    _$emailValidateTextAtom.reportRead();
    return super.emailValidateText;
  }

  @override
  set emailValidateText(String value) {
    _$emailValidateTextAtom.reportWrite(value, super.emailValidateText, () {
      super.emailValidateText = value;
    });
  }

  final _$passwordValidateTextAtom =
      Atom(name: '_LoginViewModelBase.passwordValidateText');

  @override
  String get passwordValidateText {
    _$passwordValidateTextAtom.reportRead();
    return super.passwordValidateText;
  }

  @override
  set passwordValidateText(String value) {
    _$passwordValidateTextAtom.reportWrite(value, super.passwordValidateText,
        () {
      super.passwordValidateText = value;
    });
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void obscureChange() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.obscureChange');
    try {
      return super.obscureChange();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscureText: ${obscureText},
isLoading: ${isLoading},
emailValidateText: ${emailValidateText},
passwordValidateText: ${passwordValidateText}
    ''';
  }
}
