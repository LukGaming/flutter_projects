class Injector {
  static final Injector _singleton = Injector._internal();
  factory Injector() => _singleton;

  Injector._internal();

  static final Map<Type, dynamic> _dependencies = {};
  static final Map<Type, dynamic Function(Injector)> _dependencyFactories = {};

  void registerSingleton<T>(T instance) {
    _dependencies[T] = instance;
  }

  void registerLazySingleton<T>(dynamic Function(Injector) factory) {
    _dependencyFactories[T] = factory;
  }

  T get<T>() {
    print(_dependencies[T]);
    if (!_dependencies.containsKey(T)) {
      if (_dependencyFactories.containsKey(T)) {
        _dependencies[T] = _dependencyFactories[T]!(this);
      } else {
        throw Exception("Dependency $T not registered");
      }
    }

    return _dependencies[T];
  }
}
