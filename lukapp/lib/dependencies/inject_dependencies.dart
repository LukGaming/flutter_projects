import 'package:lukapp/dependencies/injector.dart';
import 'package:lukapp/modules/auth/controllers/auth_controller.dart';

void injectDependencies() {
  var injector = Injector();
  injector.registerSingleton<AuthController>(AuthController());
}
