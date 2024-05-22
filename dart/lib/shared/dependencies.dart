import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/controllers/formatters_controller.dart';
import 'package:chuva_dart/services/dio_service_imp.dart';
import 'package:flutter/material.dart';

class Dependencies {
  static Dependencies? _instance;

  static Dependencies get instance => _instance ??= Dependencies._();

  Dependencies._();

  final Map<Type, dynamic> _objects = {};

  bool contains<T>() => _objects.containsKey(T);

  void add<T>(T instance) => contains<T>() ? throw Exception('Class ${T.runtimeType} already registered!') : _objects[T] = instance;

  T get<T>() => contains<T>() ? _objects[T] : throw Exception('Class ${T.runtimeType} not registered!');

  void remove<T>() => _objects.remove(T);

  void clear() => _objects.clear();
}

Future<bool> setupDependencies(BuildContext context) async {
  Dependencies.instance.clear();
  Dependencies.instance.add<ActivityController>(ActivityController(dio: DioServiceImp()));
  Dependencies.instance.add<FormattersController>(FormattersController());
  return true;
}
