class DependencyInjector {
  DependencyInjector._internal();
  static final DependencyInjector _instance = DependencyInjector._internal();
  static DependencyInjector get instance => _instance;

  final Map<Type, dynamic> _dependencies = {};

  T get<T>() {
    if (containsDependency(instance)) return _dependencies[T];
    throw Exception("Dependencie $T not Found");
  }

  void add<T>(T instance) {
    print(instance);
    _dependencies[T] = instance;
  }

  bool containsDependency<T>(T instance) {
    print(_dependencies);
    return _dependencies.containsKey(T);
  }

  T call<T>() {
    return get<T>();
  }
}
