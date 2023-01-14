import 'package:flutter/material.dart';
import 'package:inventory_management/Widget/item_provider.dart';
import 'package:inventory_management/Widget/browser_search_field.dart';


class BrowserFilter extends ChangeNotifier {



  List<Map<String, dynamic>> _foundItems = [];
  //String get enteredKeyword => controller ;
 // String get  controller => enteredKeyword;
// at the beginning, all users are shown


 void initialResults() {
    _foundItems = ItemProvider().allItems;
   }

  runFilter() {
    List<Map<String, dynamic>> results = [];
    if ( BrowserSearchField().searchController.text.isEmpty) {
      results = ItemProvider().allItems;
    } else {
      results = ItemProvider()
          .allItems
          .where((item) =>
              item['Item title']
                  .toLowerCase()
                  .contains(BrowserSearchField().searchController.text.toLowerCase()) ||
              item['Description']
                  .toLowerCase()
                  .contains(BrowserSearchField().searchController.text.toLowerCase()) ||
              item['Supplier']
                  .toLowerCase()
                  .contains(BrowserSearchField().searchController.text.toLowerCase()) ||
              item['Index'].toString().contains(BrowserSearchField().searchController.text) ||
              item['Stock'].toString().contains(BrowserSearchField().searchController.text))
          .toList();
    }
    // Refresh the UI
    _foundItems = results;
    notifyListeners();
  }

  List<Map<String, dynamic>> get foundItems => _foundItems;
}
