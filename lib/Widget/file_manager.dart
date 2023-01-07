import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';


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

    } else{
      return '/'; // default return value
    }
  }

  Future<File> get _file async {
    final path = await _directoryPath;
    return File('$path/LOCAL_DATABASE.txt');
  }

  Future<String> readTextFile() async {
    String fileContent = 'file not found';

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

  Future<String> writeTextFile() async {
    String text = DateFormat('h:mm:ss').format(DateTime.now());

    File file = await _file;
    await file.writeAsString(text);
    return text;
  }
}