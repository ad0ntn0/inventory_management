import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';



class FileManager {
  static FileManager _instance = FileManager._internal();

  FileManager._internal() {
    _instance = this;
  }

  factory FileManager() => _instance;

  Future<String> get _directoryPath async {
    if (Platform.isWindows) {
      Directory directory = await getApplicationDocumentsDirectory();

      return directory.path;
    } else if (Platform.isMacOS) {
      Directory directory = Directory.systemTemp;

      return directory.path;
    } else if (Platform.isAndroid) {
      Directory directory = await getApplicationDocumentsDirectory();

      return directory.path;
    } else if (Platform.isIOS) {
      Directory directory = await getApplicationDocumentsDirectory();

      return directory.path;
    } else if (Platform.isIOS) {
      Directory directory = await getApplicationDocumentsDirectory();

      return directory.path;
    } else if (kIsWeb) {
      Directory directory = Directory.systemTemp;

      return directory.path;
    } else {
      return '/'; // default return value
    }
  }

  Future<File> get _file async {
    final path = await _directoryPath;
    return File('$path/LOCAL_DATABASE.txt');
  }

  Future<String> readTextFile() async {
    String fileContent = '';

    File file = await _file;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
    }

    return fileContent;
  }

  Future<String> appendTextFile(String newEntry) async {
    String text = '';

    File file = await _file;

    // Read the contents of the file into a string
    String fileContent = await file.readAsString();

    // Append the new text to the string
    fileContent = "$fileContent\n$newEntry";

    // Write the modified string back to the file
    await file.writeAsString(fileContent);
    return text;
  }
}





