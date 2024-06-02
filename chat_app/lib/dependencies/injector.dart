import 'package:chat_app/presentation/controllers/chat_messages_controller.dart';
import 'package:chat_app/domains/logic/message_sender_logic.dart';
import 'package:chat_app/domains/services/check_internet_connection_service.dart';
import 'package:get_it/get_it.dart';

void injector() {
  GetIt i = GetIt.instance;

  i.registerLazySingleton<ICheckInternetConnectionService>(
      () => CheckInternetConnectionMock());

  i.registerLazySingleton(
    () => MessagesLogic(i(), i(), i(), i()),
  );

  i.registerLazySingleton(() => ChatMessagesController());
}
