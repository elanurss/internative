import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:internativeapp/view/_app/favorite_info.dart';
import 'package:provider/provider.dart';
import '../../core/view/bottombar.dart';
import '../auth/login/view/login_view.dart';
import '../favorites/view/favorites.dart';
import '../home/view/home_view.dart';
import '../profile/view/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void _next() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => LoginView()));
  }

  int _bottomNavIndex = 0;
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_bottomNavIndex].currentState!.maybePop();
        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.white,
          hoverColor: Colors.white,
          backgroundColor: Colors.white12.withOpacity(0.9),
          child: Badge(
            badgeContent: Text(
              Provider.of<FavoriteInfo>(context).favCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.black.withOpacity(0.9),
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Favorites()));
          },
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Colors.blue.withOpacity(0.4),
          icons: const [Iconsax.home, Iconsax.user],
          activeIndex: _bottomNavIndex,
          activeColor: Colors.blue.withOpacity(0.4),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
        body: CommonBottomNavigationBar(
          selectedIndex: _bottomNavIndex,
          navigatorKeys: _navigatorKeys,
          childrens: [HomeView(), ProfilePage()],
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [HomeView(), const LoginView()].elementAt(index);
      },
    };
  }

  // ignore: unused_element
  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);
    return Offstage(
      offstage: _bottomNavIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
