import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga_app/app/dashboard/data/dashboard_repository.dart';

import 'app/dashboard/ui/screens/dashboard_page.dart';

/// Handles all PAGE routing in the app. This only applies to Full Pages like "Dashboard"
class MagaRouter {
  /// all route names are defined here as static strings.
  static const String dashboardRoute = '/dashboard';

  /// this page will be used as fallback, when there is no matching route
  static Widget defaultPage = RepositoryProvider<DashboardRepository>(
    create: (_) => DashboardRepository(),
    child: const DashboardPage(),
  );

  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case dashboardRoute:
        page = RepositoryProvider<DashboardRepository>(
          create: (_) => DashboardRepository(),
          child: const DashboardPage(),
        );
        break;
      default:
        page = defaultPage;
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
