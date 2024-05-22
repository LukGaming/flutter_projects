import 'package:di_new/di_new.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test/test.dart';

void main() {}

class Class1 {
  final Dio dio;

  Class1({required this.dio});
}

class Dio {}

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) async {
    await Future.delayed(Duration(seconds: 1));

    i.addLazySingleton(Class1.new);
  }
}
