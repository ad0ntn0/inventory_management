import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'dart:async';
import 'package:inventory_management/file_manager.dart';
import 'package:inventory_management/file_controller.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => FileController())],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FileController>().readText();
    return MaterialApp(
      title: 'Inventory Manager',
      theme: _buildTheme(Brightness.dark),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
//    primarySwatch: Colors.green,
    appBarTheme: const AppBarTheme(/*backgroundColor: Colors.lightBlue*/),
    //canvasColor: Colors.black87,
    //primaryColorLight: const Color(0xFFFFFFFF),
    textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
  );
}

//Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InventoryBrowser(),
              ),
            );
          },
          child: const Text('Go to Browser'),
        ),
      ),
      bottomNavigationBar: GNav(
        selectedIndex: currentPageIndex,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 48),
        activeColor: Colors.lightBlue,
        tabActiveBorder: Border.all(width: 2, color: Colors.lightBlue),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        iconSize: 40,
        tabs: [
          const GButton(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.home,
            text: 'HOME',
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          GButton(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.search,
            text: 'ITEM BROWSER',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InventoryBrowser(),
                ),
              );
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

//Inventory Browser Page
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
  int currentPageIndex = 1;

//  final List<Map<String, dynamic>> _products;

  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _getTextFileItems();
  }

  Future<void> _getTextFileItems() async {
    String fileContent = await FileManager().readTextFile();
    setState(() {
      _items = fileContent.split('\n');
    });
  }

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
        title: const Text('INVENTORY BROWSER'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48, 48, 48, 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => context.read<FileController>().writeText(),
                child: const Text('REFRESH'),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context
                      .select((FileController controller) => controller.text),
                ),
              ),
            ),
            Text('$_items'),
            ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(_items[index]),);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
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
            icon: Icons.home,
            text: 'HOME',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          const GButton(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.search,
            text: 'ITEM BROWSER',
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

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD ITEM'),
      ),
      body: const Center(
        child: FilterSearch(columnTitle: 'columnTitle'),
      ),
      bottomNavigationBar: GNav(
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
            icon: Icons.home,
            text: 'HOME',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          GButton(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.search,
            text: 'ITEM BROWSER',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InventoryBrowser(),
                ),
              );
            },
          ),
          const GButton(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            gap: 8,
            icon: Icons.add_circle,
            text: 'ADD ITEM',
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Filter(
          columnTitle: 'Item Code',
          width: 128,
          labelText: 'Item Code',
          prefixText: '#',
          hintText: '000 000 000',
          icon: Icon(Icons.search),
        ),
        Filter(
          columnTitle: 'Item Title',
          width: 196,
          labelText: 'Item Title',
          hintText: 'e.g. Screw M4x12',
          icon: Icon(Icons.search),
        ),
        Filter(
          columnTitle: 'Description',
          width: 256,
          labelText: 'Description',
          hintText: 'e.g. flathead screw',
          icon: Icon(Icons.search),
        ),
        Filter(
          columnTitle: 'Stock',
          width: 128,
          labelText: 'Stock',
          hintText: 'e.g. >100',
          icon: Icon(Icons.search),
        ),
        Filter(
          columnTitle: 'Supplier',
          width: 128,
          labelText: 'Supplier',
          hintText: 'e.g. Amazon',
          icon: Icon(Icons.search),
        ),
      ],
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: SizedBox(
        width: widget.width,
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

//Text Block for search results
class DataBlock extends StatefulWidget {
  const DataBlock(
      {Key? key,
      this.columnTitle,
      this.width,
      this.prefixText,
      this.labelText,
      this.icon,
      this.itemCode,
      this.itemTitle,
      this.description,
      this.stock,
      this.supplier})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;
  final itemCode;
  final itemTitle;
  final description;
  final stock;
  final supplier;

  @override
  State<DataBlock> createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Container(
        width: widget.width,
        height: 32,
        //color: Colors.green,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3))),
        alignment: Alignment.center,
        child: Text('${widget.columnTitle}',
            style: const TextStyle(color: Color(0xFF313133))),
      ),
    );
  }
}

//Row containing Data Blocks. displays a detail view of the search results.
class ItemView extends StatefulWidget {
  const ItemView(
      {Key? key,
      this.columnTitle,
      this.width,
      this.prefixText,
      this.labelText,
      this.icon,
      this.itemCode,
      this.itemTitle,
      this.description,
      this.stock,
      this.supplier})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;
  final itemCode;
  final itemTitle;
  final description;
  final stock;
  final supplier;

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DataBlock(
          columnTitle: widget.itemCode,
          width: 128,
          labelText: 'Item Code',
          prefixText: '#',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.itemTitle,
          width: 196,
          labelText: 'Item Title',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.description,
          width: 256,
          labelText: 'Description',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.stock,
          width: 128,
          labelText: 'Stock',
          prefixText: '#',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.supplier,
          width: 128,
          labelText: 'Supplier',
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}

//Search Bar feature
class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
