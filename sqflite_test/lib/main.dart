import 'package:flutter/material.dart';
import 'package:sqflite_test/dependencies/locator.dart';
import 'package:sqflite_test/presentation/views/product_list_view.dart';
import 'package:sqflite_test/presentation/views/create_products_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const ProductListView(),
    );
  }
}
