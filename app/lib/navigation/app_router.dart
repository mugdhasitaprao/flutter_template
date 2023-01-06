import 'package:app/feature/bookmark/bookmark_page.dart';
import 'package:app/feature/home/home_page.dart';
import 'package:flutter/cupertino.dart';

import '../feature/splash/splash_page.dart';
import 'route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));
      case RoutePaths.home:
        return CupertinoPageRoute(
            builder: (context) => const HomePage(),
            settings: const RouteSettings(name: RoutePaths.home));
      case RoutePaths.bookmarkList:
        return CupertinoPageRoute(
            builder: (context) => const BookmarkPage(),
            settings: const RouteSettings(name: RoutePaths.bookmarkList));
      default:
        // Replace by Empty Page
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
