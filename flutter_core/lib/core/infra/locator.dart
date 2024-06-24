import 'package:flutter_core/core/infra/injector.dart';
import 'package:flutter_core/core/presentation/controllers/messaging_controller.dart';

Future<void> locator() async {
  final i = DependencyInjector();
  i.addSingleton(MessagingController());
}
