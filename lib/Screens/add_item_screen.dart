import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventory_management/Widget/item_import.dart';
import 'package:provider/provider.dart';

import '../controller/file_controller.dart';

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
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.end,
          //crossAxisAlignment: WrapCrossAlignment.center,
          clipBehavior: Clip.antiAlias,
          direction: Axis.vertical,
          children: [
            Wrap(
              alignment: WrapAlignment.end,
              //crossAxisAlignment: WrapCrossAlignment.center,
              clipBehavior: Clip.antiAlias,
              direction: Axis.horizontal,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ItemImport(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //height: 512,
                            width: 512,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                context.select(
                                  (FileController controller) {
                                    List<String> lines =
                                        controller.text.split('\n');
                                    return lines.isNotEmpty ? lines.last : '';
                                  },
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF313133),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
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
              Navigator.pop(context);
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
      ),
    );
  }
}
