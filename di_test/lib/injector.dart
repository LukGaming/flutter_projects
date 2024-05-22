import 'package:di_test/controllers/counter_controller.dart';
import 'package:get_it/get_it.dart';

void injector() {
  GetIt i = GetIt.instance;

  i.registerSingleton(CounterController());
}
