import 'package:flutter/material.dart';
import 'package:sqflite_test/presentation/widgets/create_product_form_widget.dart';

class CreateProductsPage extends StatefulWidget {
  const CreateProductsPage({super.key});

  @override
  State<CreateProductsPage> createState() => _CreateProductsPageState();
}

class _CreateProductsPageState extends State<CreateProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de produtos"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CreateProductFormWidget(),
          ],
        ),
      ),
    );
  }
}
