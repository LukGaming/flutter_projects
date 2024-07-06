import 'package:flutter/material.dart';
import 'package:named_routes_test/login_page.dart';
import 'package:named_routes_test/router.dart';
import 'package:named_routes_test/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initialPage,
      routes: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
