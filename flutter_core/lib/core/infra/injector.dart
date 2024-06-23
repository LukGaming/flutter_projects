import 'package:flutter_core/core/abstract/abstract_injector.dart';

class DependencyInjector implements IDependencyInjector {
  static final DependencyInjector _instance = DependencyInjector._internal();

  DependencyInjector._internal();

  factory DependencyInjector() {
    return _instance;
  }
  final Map<Type, dynamic> _singletonInstances = {};
  final Map<Type, Function> _factoryFunctions = {};
  final Map<Type, Function> _lazySingletonFunctions = {};
  final Map<Type, dynamic> _lazySingletonInstances = {};

  @override
  void addSingleton<T>(T instance) {
    _singletonInstances[T] = instance;
  }

  @override
  void addLazySingleton<T>(T Function() factoryFunc) {
    _lazySingletonFunctions[T] = factoryFunc;
  }

  @override
  void addFactory<T>(T Function() factoryFunc) {
    _factoryFunctions[T] = factoryFunc;
  }

  @override
  void removeDependency<T>() {
    _singletonInstances.remove(T);
    _factoryFunctions.remove(T);
    _lazySingletonFunctions.remove(T);
    _lazySingletonInstances.remove(T);
  }

  T get<T>() {
    if (_singletonInstances.containsKey(T)) {
      return _singletonInstances[T] as T;
    }

    if (_lazySingletonInstances.containsKey(T)) {
      return _lazySingletonInstances[T] as T;
    }

    if (_lazySingletonFunctions.containsKey(T)) {
      _lazySingletonInstances[T] = _lazySingletonFunctions[T]!();
      return _lazySingletonInstances[T] as T;
    }

    if (_factoryFunctions.containsKey(T)) {
      return _factoryFunctions[T]!() as T;
    }

    throw Exception('Dependency of type $T not found');
  }

  @override
  void dispose() {
    _singletonInstances.clear();
    _factoryFunctions.clear();
    _lazySingletonFunctions.clear();
    _lazySingletonInstances.clear();
  }
}
