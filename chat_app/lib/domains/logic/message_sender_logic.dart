import 'package:chat_app/domains/services/check_internet_connection_service.dart';
import 'package:chat_app/domains/services/file_local_service.dart';
import 'package:chat_app/domains/services/local_database_message_service.dart';
import 'package:chat_app/domains/services/remote_message_service.dart';
import 'package:chat_app/models/message.dart';

class MessagesLogic {
  final ICheckInternetConnectionService _checkInternetConnectionService;
  final IRemoteMessageService _messageService;
  final ILocalDatabaseMessage _localDatabaseMessage;
  final IFileLocalService _imageFileLocalSaver;

  MessagesLogic(
    this._checkInternetConnectionService,
    this._messageService,
    this._localDatabaseMessage,
    this._imageFileLocalSaver,
  );

  Future<Message> sendNewMessage(Message message) async {
    if (await _checkInternetConnectionService.hasConnection()) {
      //Send the message to the server
      message = await _messageService.sendMessageToUser(message);
    }

    //before saving messages localy, save the images

    message.messageFiles =
        await _imageFileLocalSaver.saveMessageFilesLocaly(message.messageFiles);
    //Save message to database

    await _localDatabaseMessage.saveMessage(message);

    return message;
  }
}
