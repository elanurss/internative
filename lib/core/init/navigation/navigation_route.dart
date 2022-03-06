import 'package:flutter/material.dart';
import 'package:internativeapp/view/article/view/article.dart';
import '../../../view/auth/login/view/login_view.dart';
import '../../../view/bottomNavigationBar/bottomNavigationBar.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../components/card/not_found_navigation.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../../view/home/model/blog_response_model.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(const SplashView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(BottomNavigation());
      case NavigationConstants.ARTICLE_DETAIL:
        if (args.arguments is BlogData) {
          return normalNavigate(ArticleDetail(
            blogData: args.arguments as BlogData,
          ));
        }
        throw Error();

      default:
        return MaterialPageRoute(builder: (context) => NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
}
