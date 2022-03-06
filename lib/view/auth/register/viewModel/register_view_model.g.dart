// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_RegisterViewModelBase.isLoading');

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
      Atom(name: '_RegisterViewModelBase.emailValidateText');

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
      Atom(name: '_RegisterViewModelBase.passwordValidateText');

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

  final _$obscureTextAtom = Atom(name: '_RegisterViewModelBase.obscureText');

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

  final _$reObscureTextAtom =
      Atom(name: '_RegisterViewModelBase.reObscureText');

  @override
  bool get reObscureText {
    _$reObscureTextAtom.reportRead();
    return super.reObscureText;
  }

  @override
  set reObscureText(bool value) {
    _$reObscureTextAtom.reportWrite(value, super.reObscureText, () {
      super.reObscureText = value;
    });
  }

  final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase');

  @override
  void obscureChange() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.obscureChange');
    try {
      return super.obscureChange();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reObscureChange() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.reObscureChange');
    try {
      return super.reObscureChange();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
emailValidateText: ${emailValidateText},
passwordValidateText: ${passwordValidateText},
obscureText: ${obscureText},
reObscureText: ${reObscureText}
    ''';
  }
}
