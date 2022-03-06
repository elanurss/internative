import 'package:flutter/material.dart';
import 'package:internativeapp/core/init/cache/locale_manager.dart';
import 'package:internativeapp/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? context;

  void setContext(BuildContext context);
  void init();

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigationService = NavigationService.instance;
}
