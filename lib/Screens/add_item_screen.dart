import 'package:flutter/material.dart';
import 'package:inventory_management/Widget/item_import.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD ITEM'),
      ),
      body: ListView(
        clipBehavior: Clip.antiAlias,
        children: const [
          ItemImport(),
        ],
      ),

      /*bottomNavigationBar: GNav(
        backgroundColor: const Color(0xFF313133),
        selectedIndex: currentPageIndex,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 48),
        activeColor: Colors.lightBlue,
        tabActiveBorder: Border.all(width: 2, color: Colors.lightBlue),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        iconSize: 40,
        onTabChange: (value) => currentPageIndex,
        tabs: [
          GButton(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.search,
            text: 'ITEM BROWSER',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          GButton(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.add_circle,
            text: 'ADD ITEM',
            onPressed: () {},
          ),
        ],
      ),*/
    );
  }
}
