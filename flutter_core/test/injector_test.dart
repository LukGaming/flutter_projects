import 'package:flutter_core/core/infra/injector.dart';
import 'package:flutter_test/flutter_test.dart';

class ServiceA {}

class ServiceB {
  final ServiceA serviceA;
  ServiceB(this.serviceA);
}

void main() {
  group('normal classes instances injector test', () {
    late DependencyInjector injector;

    setUp(() {
      injector = DependencyInjector();
      injector.clearDependencies(); // Ensure a fresh start for each test.
    });

    test('should return the same instance for a singleton', () {
      final serviceA = ServiceA();
      injector.addSingleton(serviceA);

      final instance1 = injector.get<ServiceA>();
      final instance2 = injector.get<ServiceA>();

      expect(instance1, same(instance2));
    });

    test('should create and return the same instance for a lazy singleton', () {
      injector.addLazySingleton<ServiceA>(() => ServiceA());

      final instance1 = injector.get<ServiceA>();
      final instance2 = injector.get<ServiceA>();

      expect(instance1, same(instance2));
    });

    test('should create a new instance each time for a factory', () {
      injector.addFactory<ServiceA>(() => ServiceA());

      final instance1 = injector.get<ServiceA>();
      final instance2 = injector.get<ServiceA>();

      expect(instance1, isNot(same(instance2)));
    });

    test('should remove dependencies correctly', () {
      final serviceA = ServiceA();
      injector.addSingleton(serviceA);
      injector.removeDependency<ServiceA>();

      expect(() => injector.get<ServiceA>(), throwsException);
    });

    test('should throw an exception if dependency not found', () {
      expect(() => injector.get<ServiceA>(), throwsException);
    });

    test('should clear all dependencies', () {
      final serviceA = ServiceA();
      injector.addSingleton(serviceA);
      injector.clearDependencies();

      expect(() => injector.get<ServiceA>(), throwsException);
    });

    test('should handle complex dependencies', () {
      injector.addLazySingleton<ServiceA>(() => ServiceA());
      injector.addFactory<ServiceB>(() => ServiceB(injector.get<ServiceA>()));

      final serviceB = injector.get<ServiceB>();

      expect(serviceB.serviceA, same(injector.get<ServiceA>()));
    });
  });
}
