import 'dart:io';

import 'package:chat_app/domains/repositories/message_repository.dart';
import 'package:chat_app/domains/services/file_local_service.dart';
import 'package:chat_app/domains/services/local_database_message_service.dart';
import 'package:chat_app/domains/services/remote_message_service.dart';
import 'package:chat_app/infrastructure/repositories/message_repository.dart';
import 'package:chat_app/objectbox.g.dart';
import 'package:chat_app/presentation/controllers/chat_messages_controller.dart';
import 'package:chat_app/domains/logic/message_sender_logic.dart';
import 'package:chat_app/domains/services/check_internet_connection_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

Future<void> injector() async {
  GetIt i = GetIt.instance;

  WidgetsFlutterBinding.ensureInitialized();
  Directory appDir = await getApplicationDocumentsDirectory();
  Store store = await openStore(directory: appDir.path);

  i.registerLazySingleton(
    () => FileLocalServiceImp(appDir),
  );

  i.registerLazySingleton<IFileLocalService>(() => FileLocalServiceImp(appDir));

  i.registerLazySingleton<IMessageService>(() => MessageService(i()));

  i.registerLazySingleton<IMessageRepository>(
      () => MessageRepository(store.box()));

  i.registerLazySingleton<IRemoteMessageService>(
      () => RemoteMessageServiceMock());

  i.registerLazySingleton<ICheckInternetConnectionService>(
      () => CheckInternetConnectionMock());

  i.registerLazySingleton(() => MessagesLogic(i(), i(), i(), i()));

  i.registerLazySingleton(() => ChatMessagesController(i()));
}
