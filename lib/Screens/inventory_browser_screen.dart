import 'package:flutter/material.dart';
import 'package:inventory_management/Screens/login_screen.dart';
import 'package:inventory_management/Widget/browser_filter.dart';
import 'package:inventory_management/Widget/browser_list.dart';
import 'package:inventory_management/Screens/add_item_screen.dart';


class InventoryBrowser extends StatefulWidget {
  const InventoryBrowser({super.key});

  @override
  _InventoryBrowserState createState() => _InventoryBrowserState();
}

class _InventoryBrowserState extends State<InventoryBrowser> {
  int currentPageIndex = 0;

  late TextEditingController searchController;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchController.dispose();
    super.dispose();
  }
/*
  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    searchController.addListener(BrowserFilter().runFilter());
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory Browser',
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.menu),
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.account_circle),
                        ),
                        Text("My Account"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.settings),
                        ),
                        Text("Settings"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.logout),
                        ),
                        Text("Logout"),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                } else if (value == 1) {
                  print("Settings menu is selected.");
                } else if (value == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(48, 48, 48, 48),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                ButtonBar(
                  children: [
                    const Text('Add Item', style: TextStyle(fontSize: 18),),
                    IconButton(iconSize: 48,
                        tooltip: 'Add Item',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddItem(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_circle, color: Colors.lightBlue)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) => BrowserFilter().runFilter,
                        decoration: const InputDecoration(
                            labelText: 'Search',
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                    /*Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: FilterSearch(
                        columnTitle: 'columnTitle',
                        onPressed: (value) => _runFilter(value),
                      ),
                    ),
                  ),*/
// Building the List of Search results
                     BrowserList(key: ValueKey(BrowserFilter().foundItems)),
                  ],
                ),
              ],
            ),
          ),
        ),
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
            onPressed: () {},
          ),
          GButton(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.add_circle,
            text: 'ADD ITEM',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddItem(),
                ),
              );
            },
          ),
        ],
      ),*/
    );
  }
}

//Top Row of the Search Interface containing Filter widgets
class FilterSearch extends StatefulWidget {
  const FilterSearch(
      {Key? key,
      required this.columnTitle,
      this.width,
      this.prefixText,
      this.labelText,
      this.icon,
      required this.onPressed})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;
  final onPressed;

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 48, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 48,
            width: 196,
            child: ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.lightBlue,
                ),
              ),
              onPressed: widget.onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.search),
                  Text('Filter Items'),
                ],
              ),
            ),
          ),
          const Filter(
            columnTitle: 'Item Code',
            //width: 128,
            labelText: 'Item Code',
            prefixText: '#',
            hintText: '000 000 000',
            icon: Icon(Icons.search),
          ),
          const Filter(
            columnTitle: 'Item Title',
            //width: 196,
            labelText: 'Item Title',
            hintText: 'e.g. Screw M4x12',
            icon: Icon(Icons.search),
          ),
          const Filter(
            columnTitle: 'Description',
            //width: 256,
            labelText: 'Description',
            hintText: 'e.g. flathead screw',
            icon: Icon(Icons.search),
          ),
          const Filter(
            columnTitle: 'Stock',
            //width: 128,
            labelText: 'Stock',
            hintText: 'e.g. >100',
            icon: Icon(Icons.search),
          ),
          const Filter(
            columnTitle: 'Supplier',
            //width: 128,
            labelText: 'Supplier',
            hintText: 'e.g. Amazon',
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}



// Filter Widget
class Filter extends StatefulWidget {
  const Filter({
    Key? key,
    required this.columnTitle,
    this.width,
    this.prefixText,
    this.labelText,
    this.hintText,
    this.icon,
  }) : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final hintText;
  final icon;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: SizedBox(
        width: 196,
        height: 60,
        child: TextField(
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            suffixStyle: const TextStyle(fontSize: 14),
            prefixText: widget.prefixText,
            //icon: widget.icon,
            labelText: widget.labelText,
            hintText: widget.hintText,
            hoverColor: Colors.orange,
            contentPadding: const EdgeInsets.all(2),
          ),
        ),
      ),
    );
  }
}
