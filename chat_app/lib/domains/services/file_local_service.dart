import 'dart:io';

import 'package:chat_app/infrastructure/dto/message_file.dart';

abstract class IFileLocalService {
  Future<List<MessageFile>> saveMessageFilesLocaly(List<MessageFile> files);
}

class FileLocalServiceImp implements IFileLocalService {
  final Directory applicationDirectory;

  FileLocalServiceImp(this.applicationDirectory);
  @override
  Future<List<MessageFile>> saveMessageFilesLocaly(
    List<MessageFile> files,
  ) async {
    // final File newImage = await image.
    // //First of all we have to save the image to the disk
    // File(m,e)
    throw UnimplementedError();
    return [];
  }
}
