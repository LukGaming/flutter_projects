import 'package:flutter/material.dart';
import 'package:named_routes_test/routes.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    handleNavigation();
    super.initState();
  }

  void handleNavigation() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.loginPage, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
