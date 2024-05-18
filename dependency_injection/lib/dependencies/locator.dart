import 'package:dependency_injection/dependencies/injector.dart' as myInjector;
import 'package:dependency_injection/domain/services/abstract/class1.dart';
import 'package:dependency_injection/domain/services/abstract/class2.dart';
import 'package:dependency_injection/domain/services/class1.dart';
import 'package:dependency_injection/domain/services/class2.dart';
import 'package:dependency_injection/presentation/controllers/counter_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

class LocatingWithModular extends Module {
  @override
  void binds(i) {
    i.addSingleton<Class1>(Class1Iplm.new);
    i.addSingleton<Class2>(Class2Impl.new);
  }
}

void locateIfGetIt() {
  var i = GetIt.instance;
  i.registerLazySingleton<Class2>(
    () => Class2Impl(i()),
  );

  i.registerLazySingleton<Class1>(
    () => Class1Iplm(),
  );
}

void myOwnLocator() {
  var i = myInjector.MyOwnInjector();
  i.registerLazySingleton<CounterController>(() => CounterController());

  i.registerLazySingleton<Class1>(
    () => Class1Iplm(),
  );

  i.registerLazySingleton<Class2>(
    () => Class2Impl(i()),
  );
}
