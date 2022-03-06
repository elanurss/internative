import 'package:flutter/material.dart';
import 'IAppTheme.dart';
import 'light/ILightTheme.dart';

class AppThemeLight extends IAppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= _instance = AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        textTheme: textTheme(),
        backgroundColor: colorSchemeLight.alabaster,
        colorScheme: colorScheme(),
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          backgroundColor: colorSchemeLight.ceruleanBlue,
        ),
      );

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
      headline3: textThemeLight.headline3,
      headline4: textThemeLight.headline4,
      headline5: textThemeLight.headline5,
      headline6: textThemeLight.headline6,
      subtitle1: textThemeLight.subtitle1,
      subtitle2: textThemeLight.subtitle2,
    );
  }

  ColorScheme colorScheme() {
    return ColorScheme(
        primary: colorSchemeLight.ceruleanBlue,
        primaryVariant: colorSchemeLight.white,
        secondary: colorSchemeLight.monza,
        secondaryVariant: Color(0xffff2d55),
        surface: colorSchemeLight.black,
        background: colorSchemeLight.alabaster,
        error: colorSchemeLight.black,
        onPrimary: colorSchemeLight.black,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: colorSchemeLight.black,
        onError: colorSchemeLight.black,
        brightness: Brightness.light);
  }
}
