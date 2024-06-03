import 'package:chat_app/dependencies/injector.dart';
import 'package:chat_app/presentation/widgets/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await injector();
  runApp(const MyApp());
}
