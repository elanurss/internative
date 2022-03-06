import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/navigation/navigation_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme_light.dart';
import 'view/_app/favorite_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  runApp(ChangeNotifierProvider<FavoriteInfo>(
    create: (context) => FavoriteInfo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationConstants.SPLASH_VIEW,
      theme: AppThemeLight.instance.theme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}
