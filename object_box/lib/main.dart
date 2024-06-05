import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/controllers/theme_controller.dart';
import 'package:object_box/enums/theme.dart';
import 'package:object_box/injector.dart';
import 'package:object_box/pages/todo_page.dart';

void main() async {
  await injector();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    super.initState();
    _themeController.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink(
      child: ListenableBuilder(
        listenable: _themeController,
        builder: (_, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _themeController.theme == ETheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const TodosPage(),
          );
        },
      ),
    );
  }
}
