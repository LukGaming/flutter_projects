import 'package:chat_app/domains/services/check_internet_connection_service.dart';
import 'package:chat_app/domains/services/file_local_service.dart';
import 'package:chat_app/domains/services/local_database_message_service.dart';
import 'package:chat_app/domains/services/remote_message_service.dart';
import 'package:chat_app/infrastructure/dto/message.dart';

class MessagesLogic {
  final ICheckInternetConnectionService _checkInternetConnectionService;
  final IRemoteMessageService _messageService;
  final ILocalDatabaseMessageService _localDatabaseMessageService;
  final IFileLocalService _fileLocalService;

  MessagesLogic(
    this._checkInternetConnectionService,
    this._messageService,
    this._localDatabaseMessageService,
    this._fileLocalService,
  );

  Future<Message> sendNewMessage(Message message) async {
    if (await _checkInternetConnectionService.hasConnection()) {
      //Send the message to the server
      message = await _messageService.sendMessageToUser(message);
    }

    //before saving messages localy, save the images

    message.messageFiles =
        await _fileLocalService.saveMessageFilesLocaly(message.messageFiles);
    //Save message to database

    await _localDatabaseMessageService.saveMessage(message);

    return message;
  }
}
