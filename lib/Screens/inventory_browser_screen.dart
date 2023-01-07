import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventory_management/controller/file_controller.dart';
import 'package:provider/provider.dart';
import 'package:inventory_management/Widget/search_bar.dart';
import 'package:inventory_management/Screens/add_item_screen.dart';

class InventoryBrowser extends StatefulWidget {
  const InventoryBrowser({super.key});

  @override
  _InventoryBrowserState createState() => _InventoryBrowserState();
}

/*void {
setState(() {
_produtcs => context.select((FileController controller) => controller.text),
});

}*/
class _InventoryBrowserState extends State<InventoryBrowser> {
  int currentPageIndex = 0;

//  final List<Map<String, dynamic>> _products;

/*  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _getTextFileItems();
  }

  Future<void> _getTextFileItems() async {
    String fileContent = (await FileManager().readTextFile()) as String;
    setState(() {
      _items = fileContent.split('\n');
    });
  }*/

  //String get products => context.read<FileController>().writeText() [
  /*{
      'Item code': 12345,
      'Item title': 'Blue widget',
      'Description': 'Small blue widget for organization',
      'Stock': 17,
      'Supplier': 'WidgetWorks'
    },
    {
      'Item code': 27865,
      'Item title': 'Red gizmo',
      'Description': 'Compact red gadget for entertainment',
      'Stock': 25,
      'Supplier': 'GizmoCorp'
    },
    {
      'Item code': 312345,
      'Item title': 'Yellow thingamajig',
      'Description': 'Bright yellow tool for decoration',
      'Stock': 8,
      'Supplier': 'ThingamajigCo'
    },
    {
      'Item code': 312345,
      'Item title': 'Yellow thingamajig',
      'Description': 'Bright yellow tool for decoration',
      'Stock': 8,
      'Supplier': 'ThingamajigCo'
    },
    {
      'Item code': 312345,
      'Item title': 'Yellow thingamajig',
      'Description': 'Bright yellow tool for decoration',
      'Stock': 8,
      'Supplier': 'ThingamajigCo'
    },
    {
      'Item code': 312345,
      'Item title': 'Yellow thingamajig',
      'Description': 'Bright yellow tool for decoration',
      'Stock': 8,
      'Supplier': 'ThingamajigCo'
    },
    {
      'Item code': 312345,
      'Item title': 'Yellow thingamajig',
      'Description': 'Bright yellow tool for decoration',
      'Stock': 8,
      'Supplier': 'ThingamajigCo'
    },
    {
      'Item code': 13145,
      'Item title': 'Yellow thingamajig',
      'Description': 'Bright yellow tool for decoration',
      'Stock': 8,
      'Supplier': 'ThingamajigCo'
    },*/
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inventory Browser",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48, 48, 48, 48),
        child: Wrap(
          clipBehavior: Clip.antiAlias,
          direction: Axis.horizontal,
          children: [
            Wrap(
              clipBehavior: Clip.antiAlias,
              direction: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: FilterSearch(columnTitle: 'columnTitle'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 256,
                            width: 512,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              context.select((FileController controller) =>
                                  controller.text),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF313133),
                              ),
                            ),
                          ),
                        ),
                        // Text('$_items'),
                        /*ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(_items[index]),);
                      },
                    ),*/
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
            },
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
      ),
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
      this.icon})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;

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
              onPressed: () =>
                  context.read<FileController>().writeText(),
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
  const Filter(
      {Key? key,
      required this.columnTitle,
      this.width,
      this.prefixText,
      this.labelText,
      this.hintText,
      this.icon})
      : super(key: key);

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
        child: TextFormField(
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
