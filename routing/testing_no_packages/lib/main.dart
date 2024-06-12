import 'package:flutter/material.dart';
import 'package:testing_no_packages/page_with_parameter.dart';
import 'package:testing_no_packages/product.dart';
import 'package:testing_no_packages/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      initialRoute: Routes.home,
      theme: ThemeData(
        useMaterial3: false,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha home page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Minha home page!"),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page_without_parameter');
              },
              child: const Text("Navegar para página sem parametros"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PageWithParameter.routeName,
                  arguments: Product(name: "Teste"),
                );
              },
              child: const Text("Navegar para página com parametros"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.routeToPushAndRemove,
                  (route) => false,
                );
              },
              child: const Text("Navegar para página que não volta"),
            )
          ],
        ),
      ),
    );
  }
}
