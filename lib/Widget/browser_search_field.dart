import 'package:flutter/material.dart';

class BrowserSearchField extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  BrowserSearchField();

  String get text => searchController.text;


}





//  String get enteredKeyword => controller;

