import 'package:flutter/material.dart';
import 'package:routing_with_go_router/product.dart';
import 'package:routing_with_go_router/routes.dart';

class PageWithParameter extends StatelessWidget {
  final Product product;
  const PageWithParameter({
    super.key,
    required this.product,
  });

  static final routeName = Routes.pageWithNoParameter;

  @override
  Widget build(BuildContext context) {
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
