import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:object_box/controllers/theme_controller.dart';
import 'package:object_box/enums/theme.dart';
import 'package:object_box/injector.dart';
import 'package:object_box/pages/todo_page.dart';

void main() async {
  await injector();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _themeController = GetIt.instance<ThemeController>();
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
