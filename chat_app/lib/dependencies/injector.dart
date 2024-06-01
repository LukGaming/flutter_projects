import 'package:chat_app/controllers/chat_messages_controller.dart';
import 'package:get_it/get_it.dart';

void injector() {
  GetIt i = GetIt.instance;
  i.registerLazySingleton(() => ChatMessagesController());
}
