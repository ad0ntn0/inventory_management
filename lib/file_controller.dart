import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/file_manager.dart';
import 'package:flutter/material.dart';

class FileController extends ChangeNotifier {
  String _text = 'ABC';

  String get text => _text;


  readText() async {
    _text = await FileManager().readTextFile();
    notifyListeners();
  }

  writeText() async {
    _text = await FileManager().writeTextFile();
    notifyListeners();
  }
}