import 'package:flutter/material.dart';
import 'package:testing_no_packages/product.dart';
import 'package:testing_no_packages/routes.dart';

class PageWithParameter extends StatelessWidget {
  const PageWithParameter({
    super.key,
  });

  static final routeName = Routes.pageWithNoParameter;

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Page with parameter"),
      ),
      body: Center(
        child: Card(
          child: ListTile(title: Text("nome do produto: ${product.name}")),
        ),
      ),
    );
  }
}
