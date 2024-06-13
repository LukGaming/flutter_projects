import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_with_go_router/product.dart';
import 'package:routing_with_go_router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      title: 'Flutter Demo',
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
                context.push(Routes.pageWithNoParameter);
              },
              child: const Text("Navegar para página sem parametros"),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(
                  Uri(
                      path: Routes.pageWithParameter,
                      queryParameters: {'product-id': '1'}).toString(),
                );
              },
              child: const Text("Navegar para página com parametros"),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(Routes.routeToPushAndRemove);
              },
              child: const Text("Navegar para página que não volta"),
            )
          ],
        ),
      ),
    );
  }
}
