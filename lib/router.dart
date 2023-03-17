import 'package:flutter/material.dart';

import 'app/dashboard/ui/dashboard_page.dart';

/// Handles all PAGE routing in the app. This only applies to Full Pages like "Dashboard"
class MagaRouter {
  /// all route names are defined here as static strings.
  static const String dashboardRoute = '/dashboard';

  /// this page will be used as fallback, when there is no matching route
  static const Widget defaultPage = DashboardPage();

  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case dashboardRoute:
        page = const DashboardPage();
        break;
      default:
        page = defaultPage;
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
