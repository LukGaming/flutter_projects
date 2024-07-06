import 'package:flutter/material.dart';
import 'package:named_routes_test/routes.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página inicial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Informações da página inicial..."),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.dashboard);
              },
              child: const Text("Navegar para Dashboard"),
            )
          ],
        ),
      ),
    );
  }
}
