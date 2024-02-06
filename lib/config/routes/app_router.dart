import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/config/routes/app_route_names.dart';
import 'package:flutter_riverpod_example/config/widget/error/error_page.dart';

import '../../features/dashboard/view/dashboard.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _animatedRoute(const Dashboard());
      case AppRouteNames.dashboard:
        return _animatedRoute(const Dashboard());
      case AppRouteNames.bottomAppBar:
        return _materialRoute(const BottomAppBar());
      default:
        return _errorRoute("Route not found. Please check the route name.");
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> _errorRoute(
    String error,
  ) {
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        errorString: error,
      ),
    );
  }

  static Route<dynamic> _animatedRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => view,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
