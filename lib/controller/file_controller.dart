import 'package:flutter/material.dart';
import 'package:inventory_management/Widget/file_manager.dart';


class FileController extends ChangeNotifier {
  String _text = '';

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