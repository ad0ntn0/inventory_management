import 'package:universal_io/io.dart';




class FileManager {
  static FileManager _instance = FileManager.internal();

  FileManager.internal() {
    _instance = this;
  }

  factory FileManager() => _instance;

  Future<String> get _directoryPath async {
    Directory directory = Directory.systemTemp;
    return directory.path;
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

  Future<String> writeTextFile() async {
    String text = 'Item code: 12345, Item title: Blue widget,Description: Small blue widget for organization,Stock: 17,Supplier: WidgetWorks;Item code: 27865,Item title: Red gizmo,Description: Compact red gadget for entertainment,Stock: 25,Supplier: GizmoCorp';

    File file = await _file;
    await file.writeAsString(text);
    return text;
  }
}