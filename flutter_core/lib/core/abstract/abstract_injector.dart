abstract class IDependencyInjector {
  void addSingleton<T>(T instance);
  void addLazySingleton<T>(T Function() factoryFunc);
  void addFactory<T>(T Function() factoryFunc);
  void removeDependency<T>();
  void dispose();
}
