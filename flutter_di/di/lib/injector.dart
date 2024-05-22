import 'package:di/controllers/class1_controller.dart';
import 'package:di/controllers/class2_controller.dart';
import 'package:di/repositories/http_request.dart';
import 'package:di/repositories/repository1.dart';
import 'package:get_it/get_it.dart';

void injector() {
  var i = GetIt.instance;

  i.registerSingleton(HttpRequestImp());

  i.registerLazySingleton(
    () => ClassController2(
      controller1: i(),
      httpRequest: i(),
    ),
  );

  i.registerLazySingleton(
    () => ClassController1(repository1: i()),
  );

  i.registerFactory(
    () => Repository1(),
  );
}
