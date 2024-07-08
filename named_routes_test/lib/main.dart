import 'package:flutter/material.dart';
import 'package:named_routes_test/app_page.dart';
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
      routes: router,
      initialRoute: Routes.initialPage,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}
