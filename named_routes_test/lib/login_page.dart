import 'package:flutter/material.dart';
import 'package:named_routes_test/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página de Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Página de Login"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.appPage,
                  (route) => false,
                );
              },
              child: const Text(
                "Efetuar login",
              ),
            )
          ],
        ),
      ),
    );
  }
}
