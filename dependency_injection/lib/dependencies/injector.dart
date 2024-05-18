class MyOwnInjector {
  static final MyOwnInjector _singleton = MyOwnInjector._internal();
  factory MyOwnInjector() => _singleton;

  MyOwnInjector._internal();

  static final Map<Type, dynamic> _dependencies = {};

  static final Map<Type, dynamic Function()> _dependencyFactories = {};

  void registerSingleton<T>(T instance) {
    _dependencies[T] = instance;
  }

  T call<T>() {
    return instance<T>();
  }

  void registerLazySingleton<T>(dynamic Function() factory) {
    _dependencyFactories[T] = factory;
  }

  T instance<T>() {
    if (!_dependencies.containsKey(T)) {
      if (_dependencyFactories.containsKey(T)) {
        _dependencies[T] = _dependencyFactories[T]!();
      } else {
        throw Exception("Dependency $T not registered");
      }
    }
    return _dependencies[T];
  }
}
