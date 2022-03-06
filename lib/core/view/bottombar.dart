import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final List<GlobalKey<NavigatorState>> navigatorKeys;
  final List<Widget> childrens;
  var _size;

  CommonBottomNavigationBar({
    required this.selectedIndex,
    required this.navigatorKeys,
    required this.childrens,
  }) {
    assert(navigatorKeys.length == childrens.length);
    _size = childrens.length;
  }

  @override
  _CommonBottomNavigationBarState createState() =>
      _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: List.generate(widget._size, (index) {
      return _buildOffstageNavigator(index);
    }));
  }

  Widget _buildOffstageNavigator(int index) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            await widget.navigatorKeys[index].currentState!.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Offstage(
        offstage: widget.selectedIndex != index,
        child: _BottomBarNavigator(
          navigatorKey: widget.navigatorKeys[index],
          child: widget.childrens[index],
        ),
      ),
    );
  }
}

class _BottomBarNavigator extends StatelessWidget {
  _BottomBarNavigator({
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      '/': (context) {
        return child;
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders;
    routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        return CupertinoPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
