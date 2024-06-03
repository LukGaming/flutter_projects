import 'dart:io';

import 'package:chat_app/infrastructure/dto/message_file.dart';
import 'package:path/path.dart' as path;

abstract class IFileLocalService {
  Future<List<MessageFile>> saveMessageFilesLocaly(List<MessageFile> files);
}

class FileLocalServiceImp implements IFileLocalService {
  final Directory applicationDirectory;

  final String filesDirectory = "files";

  FileLocalServiceImp(this.applicationDirectory);

  @override
  Future<List<MessageFile>> saveMessageFilesLocaly(
      List<MessageFile> files) async {
    for (int i = 0; i < files.length; i++) {
      files[i].localStoragePath =
          await copyImageToLocalDiskAndGenerateNewFilePath(files[i]);
    }
    return files;
  }

  Future<bool> verifyThatFileDirectoryExists() async {
    final dir = Directory(getTheDirectoryToSaveFiles());
    return await dir.exists();
  }

  Future<void> createFilesDirectory() async {
    final dirPath = getTheDirectoryToSaveFiles();
    final dir = Directory(dirPath);

    if (await dir.exists()) {
      final fileStat = await dir.stat();
      if (fileStat.type == FileSystemEntityType.file) {
        // If a file exists with the same name, delete it
        await File(dirPath).delete();
      }
    }

    if (!await dir.exists()) {
      await createDirectory();
    }
  }

  Future<void> createDirectory() async {
    await Directory(getTheDirectoryToSaveFiles()).create(recursive: true);
  }

  Future<bool> verifyThatFileExists(String filePath) async {
    return await File(filePath).exists();
  }

  Future<File> getFileFromPath(String path) async {
    return File(path);
  }

  String getTheDirectoryToSaveFiles() {
    return path.join(applicationDirectory.path, filesDirectory);
  }

  Future<String> copyImageToLocalDiskAndGenerateNewFilePath(
    MessageFile messageFile,
  ) async {
    // Creating the directory to save files
    await createFilesDirectory();

    // Verify that file exists
    bool fileExists = await verifyThatFileExists(messageFile.localStoragePath!);

    if (fileExists) {
      final File recoveredFile =
          await getFileFromPath(messageFile.localStoragePath!);
      final newFilePath = path.join(getTheDirectoryToSaveFiles(),
          path.basename(messageFile.localStoragePath!));
      File newFile = await recoveredFile.copy(newFilePath);

      print(newFile.toString());

      return newFile.path;
    }
    return "";
  }
}
