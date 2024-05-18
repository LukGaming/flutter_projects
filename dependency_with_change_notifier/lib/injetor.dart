import 'package:dependency_with_change_notifier/counter_controller.dart';
import 'package:dependency_with_change_notifier/counter_repository.dart';
import 'package:get_it/get_it.dart';

void injetor() {
  injectCounter();
  otherModule();
}

void injectCounter() {
  final GetIt i = GetIt.instance;
  i.registerLazySingleton(
    () => CounterController(
      i(),
    ),
  );

  i.registerLazySingleton(
    () => CounterRepository(),
  );
}

void otherModule() {}
