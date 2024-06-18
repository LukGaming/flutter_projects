import 'package:chat_app/domains/services/check_internet_connection_service.dart';
import 'package:chat_app/domains/services/file_local_service.dart';
import 'package:chat_app/domains/services/local_database_message_service.dart';
import 'package:chat_app/domains/services/remote_message_service.dart';
import 'package:chat_app/domains/models/message.dart';
import 'package:chat_app/domains/models/users_chat_message.dart';

class MessagesLogic {
  final ICheckInternetConnectionService _checkInternetConnectionService;
  final IRemoteMessageService _remoteMessageService;
  final IMessageService _messageService;
  final IFileLocalService _fileLocalService;

  MessagesLogic(
    this._checkInternetConnectionService,
    this._remoteMessageService,
    this._messageService,
    this._fileLocalService,
  );

  Future<List<Message>> getMessagesFromUserChat(
    UsersChatMessage userChatMessage,
  ) async {
    return await _messageService.getMessagesFromUserChat(userChatMessage);
  }

  Future<Message> sendNewMessage(Message message) async {
    if (await _checkInternetConnectionService.hasConnection()) {
      //Send the message to the server
      message = await _remoteMessageService.sendMessageToUser(message);
    }

    //before saving messages localy, save the images

    message.messageFiles =
        await _fileLocalService.saveMessageFilesLocaly(message.messageFiles);
    //Save message to database

    print("saved: ${message.messageFiles.length} files");

    await _messageService.saveMessage(message);

    return message;
  }
}
