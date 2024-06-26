import 'package:flutter_core/core/infra/injector_imp.dart';
import 'package:flutter_test/flutter_test.dart';

// Define abstract classes and implementations for testing
abstract class IServiceA {}

class ServiceA implements IServiceA {}

abstract class IServiceB {}

class ServiceB implements IServiceB {
  final IServiceA serviceA;
  ServiceB(this.serviceA);
}

void main() {
  group('DependencyInjector with Abstract Classes', () {
    late DependencyInjector injector;

    setUp(() {
      injector = DependencyInjector();
      injector.clearDependencies(); // Ensure a fresh start for each test.
    });

    test('should return the same instance for a singleton', () {
      final serviceA = ServiceA();
      injector.addSingleton<IServiceA>(serviceA);

      final instance1 = injector.get<IServiceA>();
      final instance2 = injector.get<IServiceA>();

      expect(instance1, same(instance2));
    });

    test('should create and return the same instance for a lazy singleton', () {
      injector.addLazySingleton<IServiceA>(() => ServiceA());

      final instance1 = injector.get<IServiceA>();
      final instance2 = injector.get<IServiceA>();

      expect(instance1, same(instance2));
    });

    test('should create a new instance each time for a factory', () {
      injector.addFactory<IServiceA>(() => ServiceA());

      final instance1 = injector.get<IServiceA>();
      final instance2 = injector.get<IServiceA>();

      expect(instance1, isNot(same(instance2)));
    });

    test('should remove dependencies correctly', () {
      final serviceA = ServiceA();
      injector.addSingleton<IServiceA>(serviceA);
      injector.removeDependency<IServiceA>();

      expect(() => injector.get<IServiceA>(), throwsException);
    });

    test('should throw an exception if dependency not found', () {
      expect(() => injector.get<IServiceA>(), throwsException);
    });

    test('should clear all dependencies', () {
      final serviceA = ServiceA();
      injector.addSingleton<IServiceA>(serviceA);
      injector.clearDependencies();

      expect(() => injector.get<IServiceA>(), throwsException);
    });
  });
}
