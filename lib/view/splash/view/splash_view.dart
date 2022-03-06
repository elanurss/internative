import 'package:flutter/material.dart';
import '../../../core/constants/enums/preferences_key_enum.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN) != "") {
        NavigationService.instance.navigateToPageClear(path: "/home");
      } else {
        NavigationService.instance.navigateToPageClear(path: "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: context.paddingNormaHorizontal,
          child: Image.asset(ImageConstants.instance.logo),
        ),
      ),
    );
  }
}
