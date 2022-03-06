import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    _instance ??= _instance = ColorSchemeLight._init();
    return _instance!;
  }

  ColorSchemeLight._init();

  final Color ceruleanBlue = Color(0XFF2547CA);
  final Color white = Color(0XFFFFFFFF);
  final Color black = Color(0XFF000000);
  final Color alabaster = Color(0XFFF7F7F7);
  final Color monza = Color(0XFFD51307);
}
