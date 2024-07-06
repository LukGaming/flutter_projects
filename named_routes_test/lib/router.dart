import 'package:flutter/material.dart';
import 'package:named_routes_test/app_page.dart';
import 'package:named_routes_test/dashboard_page.dart';
import 'package:named_routes_test/initial_page.dart';
import 'package:named_routes_test/login_page.dart';
import 'package:named_routes_test/routes.dart';

Map<String, Widget Function(BuildContext context)> router = {
  Routes.initialPage: (context) => const InitialPage(),
  Routes.loginPage: (context) => const LoginPage(),
  Routes.appPage: (context) => const AppPage(),
  Routes.dashboard: (context) => const DashBoardPage(),
};
